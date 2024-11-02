
// To parse this JSON data, do
//
//     final subCategoryModel = subCategoryModelFromJson(jsonString);

import 'dart:convert';

SubCategoryModel subCategoryModelFromJson(String str) => SubCategoryModel.fromJson(json.decode(str));

String subCategoryModelToJson(SubCategoryModel data) => json.encode(data.toJson());

class SubCategoryModel {
  int? statusCode;
  Result? result;

  SubCategoryModel({
    this.statusCode,
    this.result,
  });

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) => SubCategoryModel(
    statusCode: json["status_code"],
    result: json["result"] == null ? null : Result.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "status_code": statusCode,
    "result": result?.toJson(),
  };
}

class Result {
  bool? category;
  List<Datum>? data;

  Result({
    this.category,
    this.data,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    category: json["category"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "category": category,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  int? id;
  String? homepageName;
  String? categoryName;
  String? subCategoryName;
  String? homepageNameImage;
  String? categoryImage;
  String? subCategoryImage;
  DateTime? createdAt;
  DateTime? updatedAt;

  Datum({
    this.id,
    this.homepageName,
    this.categoryName,
    this.subCategoryName,
    this.homepageNameImage,
    this.categoryImage,
    this.subCategoryImage,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    homepageName: json["homepage_name"],
    categoryName: json["category_name"],
    subCategoryName: json["sub_category_name"],
    homepageNameImage: json["homepage_name_image"],
    categoryImage: json["category_image"],
    subCategoryImage: json["sub_category_image"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "homepage_name": homepageName,
    "category_name": categoryName,
    "sub_category_name": subCategoryName,
    "homepage_name_image": homepageNameImage,
    "category_image": categoryImage,
    "sub_category_image": subCategoryImage,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
