// To parse this JSON data, do
//
//     final collectionModel = collectionModelFromJson(jsonString);

import 'dart:convert';

CollectionModel collectionModelFromJson(String str) => CollectionModel.fromJson(json.decode(str));

String collectionModelToJson(CollectionModel data) => json.encode(data.toJson());

class CollectionModel {
  int statusCode;
  List<Result> result;

  CollectionModel({
    required this.statusCode,
    required this.result,
  });

  factory CollectionModel.fromJson(Map<String, dynamic> json) => CollectionModel(
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
  String homepageName;
  String categoryName;
  String? subCategoryName;
  String homepageNameImage;
  String categoryImage;
  String? subCategoryImage;
  DateTime createdAt;
  DateTime updatedAt;

  Result({
    required this.id,
    required this.homepageName,
    required this.categoryName,
    required this.subCategoryName,
    required this.homepageNameImage,
    required this.categoryImage,
    required this.subCategoryImage,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    homepageName: json["homepage_name"],
    categoryName: json["category_name"],
    subCategoryName: json["sub_category_name"],
    homepageNameImage: json["homepage_name_image"],
    categoryImage: json["category_image"],
    subCategoryImage: json["sub_category_image"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "homepage_name": homepageName,
    "category_name": categoryName,
    "sub_category_name": subCategoryName,
    "homepage_name_image": homepageNameImage,
    "category_image": categoryImage,
    "sub_category_image": subCategoryImage,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
