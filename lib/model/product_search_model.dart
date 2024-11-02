// To parse this JSON data, do
//
//     final productSearchModel = productSearchModelFromJson(jsonString);

import 'dart:convert';

List<ProductSearchModel> productSearchModelFromJson(String str) => List<ProductSearchModel>.from(json.decode(str).map((x) => ProductSearchModel.fromJson(x)));

String productSearchModelToJson(List<ProductSearchModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductSearchModel {
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

  ProductSearchModel({
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

  factory ProductSearchModel.fromJson(Map<String, dynamic> json) => ProductSearchModel(
    id: json["id"],
    productName: json["product_name"],
    itemDescription: json["item_description"],
    itemNo: json["item_no"],
    availableQuantity: json["available_quantity"],
    unitPrice: json["unit_price"],
    unitCost: json["unit_cost"],
    measureUnit: json["measure_unit"],
    projectedAvailableDate: json["projected_available_date"] == null ? null : DateTime.parse(json["projected_available_date"]),
    projectedAvailableQty: double.parse(json["projected_available_qty"].toString()),
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
