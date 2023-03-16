import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

class MapIntegration {
  Future<Position> _getUserCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<Map<String, dynamic>> getLocation() async {
    final Map<String, dynamic> userLocationData = {};
    final position = await _getUserCurrentLocation();
    try {
      debugPrint('location: ${position.latitude} : ${position.longitude}');
      var addresses = await placemarkFromCoordinates(
          position.latitude.toDouble(), position.longitude.toDouble());
      var first = addresses.first;
      userLocationData.clear();
      userLocationData.addAll({
        'latitude': position.latitude,
        'longitude': position.longitude,
        'street': first.street,
        'locality': first.locality,
        'state': first.administrativeArea,
        'postal_code': first.postalCode,
        'country': first.country
      });
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        const String error = 'please grant permission';
        log(error);
        userLocationData.addAll({'status': 'Please grant permission'});
      }
      if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
        const String error =
            'permission denied- please enable it from app settings';
        log(error);

        userLocationData.addAll({'status': 'Permission denied'});
      }
    }
    return userLocationData;
  }

  getDirection() async {
    const String lat = '8.5581';
    const String long = '76.8816';
    bool serviceEnabled;
    var userPosition = await getLocation();
    final currentLatitude = userPosition['latitude'];
    final currentLongitude = userPosition['longitude'];
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (serviceEnabled) {
      log(userPosition.toString(), name: 'position');
      String googleUrl =
          'https://www.google.com/maps/dir/?api=1&origin=$currentLatitude,$currentLongitude&destination=$lat,$long&travelmode=driving&layer=traffic';
      String appleUrl =
          'https://maps.apple.com/?sll=$currentLatitude,$currentLongitude';
      if (await canLaunchUrl(Uri.parse(googleUrl))) {
        log('launching com googleUrl');
        await launchUrl(
          Uri.parse(googleUrl),
          mode: LaunchMode.externalApplication,
        );
        // await launchUrl(Uri(
        //     scheme: 'https',
        //     host: 'www.google.com',
        //     path: '/maps/dir/',
        //     queryParameters: {
        //       'api': '1',
        //       'origin': '$currentLatitude,$currentLongitude',
        //       'destination': '$lat,$long',
        //       'travelmode': 'driving'
        //     }));
      } else if (await canLaunchUrl(Uri.parse(appleUrl))) {
        log('launching apple url');
        await launchUrl(
          Uri.parse(appleUrl),
          mode: LaunchMode.externalApplication,
        );
      } else {
        throw 'Could not launch url';
      }
    } else {
      log('location disabled');
      Geolocator.requestPermission();
    }
  }
}
