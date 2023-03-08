// To parse this JSON data, do
//
//     final dummyCustomer = dummyCustomerFromJson(jsonString);

import 'dart:convert';

List<DummyCustomer> dummyCustomerFromJson(String str) =>
    List<DummyCustomer>.from(
        json.decode(str).map((x) => DummyCustomer.fromJson(x)));

String dummyCustomerToJson(List<DummyCustomer> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DummyCustomer {
  DummyCustomer({
    this.id,
    this.name,
    this.userId,
    this.profilePic,
    this.place,
  });

  int? id;
  String? name;
  int? userId;
  String? profilePic;
  String? place;

  factory DummyCustomer.fromJson(Map<String, dynamic> json) => DummyCustomer(
        id: json["id"],
        name: json["name"],
        userId: json["user_id"],
        profilePic: json["profile_pic"],
        place: json["place"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "user_id": userId,
        "profile_pic": profilePic,
        "place": place,
      };
}
