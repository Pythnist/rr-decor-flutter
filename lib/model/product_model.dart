// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  int? statusCode;
  List<Result>? result;

  ProductModel({
    this.statusCode,
    this.result,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
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
  String? productName;
  String? image;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? collection;
  List<ProductDetail>? productDetails;

  Result({
    this.id,
    this.productName,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.collection,
    this.productDetails,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    productName: json["product_name"],
    image: json["image"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    collection: json["collection"],
    productDetails: json["product_details"] == null ? [] : List<ProductDetail>.from(json["product_details"]!.map((x) => ProductDetail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_name": productName,
    "image": image,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "collection": collection,
    "product_details": productDetails == null ? [] : List<dynamic>.from(productDetails!.map((x) => x.toJson())),
  };
}

class ProductDetail {
  int? id;
  String? productName;
  String? itemDescription;
  String? itemNo;
  String? availableQuantity;
  String? unitPrice;
  String? unitCost;
  String? measureUnit;
  DateTime? projectedAvailableDate;
  double? projectedAvailableQty;
  dynamic image;
  DateTime? createdAt;
  DateTime? updatedAt;

  ProductDetail({
    this.id,
    this.productName,
    this.itemDescription,
    this.itemNo,
    this.availableQuantity,
    this.unitPrice,
    this.unitCost,
    this.measureUnit,
    this.projectedAvailableDate,
    this.projectedAvailableQty,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  factory ProductDetail.fromJson(Map<String, dynamic> json) => ProductDetail(
    id: json["id"],
    productName: json["product_name"],
    itemDescription: json["item_description"],
    itemNo: json["item_no"],
    availableQuantity: json["available_quantity"],
    unitPrice: json["unit_price"],
    unitCost: json["unit_cost"],
    measureUnit: json["measure_unit"],
    projectedAvailableDate: json["projected_available_date"] == null ? null : DateTime.parse(json["projected_available_date"]),
    projectedAvailableQty: json["projected_available_qty"]?.toDouble(),
    image: json["image"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_name": productName,
    "item_description": itemDescription,
    "item_no": itemNo,
    "available_quantity": availableQuantity,
    "unit_price": unitPrice,
    "unit_cost": unitCost,
    "measure_unit": measureUnit,
    "projected_available_date": projectedAvailableDate?.toIso8601String(),
    "projected_available_qty": projectedAvailableQty,
    "image": image,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
