// To parse this JSON data, do
//
//     final discontinueModel = discontinueModelFromJson(jsonString);

import 'dart:convert';

DiscontinueModel discontinueModelFromJson(String str) => DiscontinueModel.fromJson(json.decode(str));

String discontinueModelToJson(DiscontinueModel data) => json.encode(data.toJson());

class DiscontinueModel {
  int? statusCode;
  List<Response>? response;

  DiscontinueModel({
    this.statusCode,
    this.response,
  });

  factory DiscontinueModel.fromJson(Map<String, dynamic> json) => DiscontinueModel(
    statusCode: json["status_code"],
    response: json["response"] == null ? [] : List<Response>.from(json["response"]!.map((x) => Response.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status_code": statusCode,
    "response": response == null ? [] : List<dynamic>.from(response!.map((x) => x.toJson())),
  };
}

class Response {
  int? id;
  String? title;
  String? image;
  DateTime? createdAt;
  DateTime? updatedAt;

  Response({
    this.id,
    this.title,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    id: json["id"],
    title: json["title"],
    image: json["image"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "image": image,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
