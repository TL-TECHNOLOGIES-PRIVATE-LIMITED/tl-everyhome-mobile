// To parse this JSON data, do
//
//     final dummyBussiness = dummyBussinessFromJson(jsonString);

import 'dart:convert';

List<DummyBussiness> dummyBussinessFromJson(String str) =>
    List<DummyBussiness>.from(
        json.decode(str).map((x) => DummyBussiness.fromJson(x)));

String dummyBussinessToJson(List<DummyBussiness> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DummyBussiness {
  DummyBussiness({
    this.id,
    this.userId,
    this.name,
    this.place,
    this.profilePic,
    this.description,
    this.skills,
    this.portfolioImage,
  });

  int? id;
  int? userId;
  String? name;
  String? place;
  String? profilePic;
  String? description;
  List<String>? skills;
  List<dynamic>? portfolioImage;

  factory DummyBussiness.fromJson(Map<String, dynamic> json) => DummyBussiness(
        id: json["id"],
        userId: json["user_id"],
        name: json["name"],
        place: json["place"],
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
        "profile_pic": profilePic,
        "description": description,
        "skills":
            skills == null ? [] : List<dynamic>.from(skills!.map((x) => x)),
        "portfolio_image": portfolioImage == null
            ? []
            : List<dynamic>.from(portfolioImage!.map((x) => x)),
      };
}
