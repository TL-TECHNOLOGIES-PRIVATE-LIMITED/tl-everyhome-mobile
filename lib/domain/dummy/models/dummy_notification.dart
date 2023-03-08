// To parse this JSON data, do
//
//     final dummyNotification = dummyNotificationFromJson(jsonString);

import 'dart:convert';

List<DummyNotification> dummyNotificationFromJson(String str) =>
    List<DummyNotification>.from(
        json.decode(str).map((x) => DummyNotification.fromJson(x)));

String dummyNotificationToJson(List<DummyNotification> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DummyNotification {
  DummyNotification({
    this.id,
    this.senderId,
    this.message,
    this.date,
  });

  int? id;
  int? senderId;
  String? message;
  String? date;

  factory DummyNotification.fromJson(Map<String, dynamic> json) =>
      DummyNotification(
        id: json["id"],
        senderId: json["sender_id"],
        message: json["message"],
        date: json["date"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sender_id": senderId,
        "message": message,
        "date": date,
      };
}
