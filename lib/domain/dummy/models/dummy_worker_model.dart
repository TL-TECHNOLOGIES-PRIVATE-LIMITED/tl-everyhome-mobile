// To parse this JSON data, do
//
//     final dummyWorker = dummyWorkerFromJson(jsonString);

import 'dart:convert';

List<DummyWorker> dummyWorkerFromJson(String str) => List<DummyWorker>.from(
    json.decode(str).map((x) => DummyWorker.fromJson(x)));

String dummyWorkerToJson(List<DummyWorker> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DummyWorker {
  DummyWorker({
    this.id,
    this.userId,
    this.name,
    this.place,
    this.workerPrice,
    this.profilePic,
    this.description,
    this.skills,
    this.portfolioImage,
  });

  int? id;
  int? userId;
  String? name;
  String? place;
  int? workerPrice;
  String? profilePic;
  String? description;
  List<String>? skills;
  List<dynamic>? portfolioImage;

  factory DummyWorker.fromJson(Map<String, dynamic> json) => DummyWorker(
        id: json["id"],
        userId: json["user_id"],
        name: json["name"],
        place: json["place"],
        workerPrice: json["worker_price"],
        profilePic: json["profile_pic"],
        description: json["description"],
        skills: json["skills"] == null
            ? []
            : List<String>.from(json["skills"]!.map((x) => x)),
        portfolioImage: json["portfolio_image"] == null
            ? []
            : List<dynamic>.from(json["portfolio_image"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "name": name,
        "place": place,
        "worker_price": workerPrice,
        "profile_pic": profilePic,
        "description": description,
        "skills":
            skills == null ? [] : List<dynamic>.from(skills!.map((x) => x)),
        "portfolio_image": portfolioImage == null
            ? []
            : List<dynamic>.from(portfolioImage!.map((x) => x)),
      };
}
