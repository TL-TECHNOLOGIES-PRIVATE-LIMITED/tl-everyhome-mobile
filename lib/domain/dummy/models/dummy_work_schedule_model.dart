// To parse this JSON data, do
//
//     final dummyWorkSchedule = dummyWorkScheduleFromJson(jsonString);

import 'dart:convert';

DummyWorkSchedule dummyWorkScheduleFromJson(String str) =>
    DummyWorkSchedule.fromJson(json.decode(str));

String dummyWorkScheduleToJson(DummyWorkSchedule data) =>
    json.encode(data.toJson());

class DummyWorkSchedule {
  DummyWorkSchedule({
    this.id,
    this.customerId,
    this.workerId,
    this.issueType,
    this.issueDescription,
    this.images,
    this.customerAddress,
    this.date,
    this.time,
  });

  int? id;
  int? customerId;
  int? workerId;
  String? issueType;
  String? issueDescription;
  List<dynamic>? images;
  String? customerAddress;
  String? date;
  String? time;

  factory DummyWorkSchedule.fromJson(Map<String, dynamic> json) =>
      DummyWorkSchedule(
        id: json["id"],
        customerId: json["customer_id"],
        workerId: json["worker_id"],
        issueType: json["issue_type"],
        issueDescription: json["issue_description"],
        images: json["images"] == null
            ? []
            : List<dynamic>.from(json["images"]!.map((x) => x)),
        customerAddress: json["customer_address"],
        date: json["date"],
        time: json["time"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "customer_id": customerId,
        "worker_id": workerId,
        "issue_type": issueType,
        "issue_description": issueDescription,
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "customer_address": customerAddress,
        "date": date,
        "time": time,
      };
}
