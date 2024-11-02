
// To parse this JSON data, do
//
//     final bannerModel = bannerModelFromJson(jsonString);

import 'dart:convert';

BannerModel bannerModelFromJson(String str) => BannerModel.fromJson(json.decode(str));

String bannerModelToJson(BannerModel data) => json.encode(data.toJson());

class BannerModel {
  int statusCode;
  List<Result> result;

  BannerModel({
    required this.statusCode,
    required this.result,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
    statusCode: json["status_code"],
    result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status_code": statusCode,
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
  };
}

class Result {
  int id;
  String name;
  String bannerImage;
  DateTime createdAt;
  DateTime updatedAt;

  Result({
    required this.id,
    required this.name,
    required this.bannerImage,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    name: json["name"],
    bannerImage: json["banner_image"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "banner_image": bannerImage,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
