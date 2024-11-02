// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

CategoryModel categoryModelFromJson(String str) => CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  int? statusCode;
  List<Result>? result;

  CategoryModel({
    this.statusCode,
    this.result,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    statusCode: json["status_code"],
    result: json["result"] == null ? [] : List<Result>.from(json["result"]!.map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status_code": statusCode,
    "result": result == null ? [] : List<dynamic>.from(result!.map((x) => x.toJson())),
  };
}

class Result {
  int? id;
  String? homepageName;
  String? categoryName;
  String? subCategoryName;
  String? homepageNameImage;
  String? categoryImage;
  String? subCategoryImage;
  DateTime? createdAt;
  DateTime? updatedAt;

  Result({
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

  factory Result.fromJson(Map<String, dynamic> json) => Result(
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
