// To parse this JSON data, do
//
//     final cartListModel = cartListModelFromJson(jsonString);

import 'dart:convert';

CartListModel cartListModelFromJson(String str) => CartListModel.fromJson(json.decode(str));

String cartListModelToJson(CartListModel data) => json.encode(data.toJson());

class CartListModel {
  int? statusCode;
  List<Result>? result;

  CartListModel({
    this.statusCode,
    this.result,
  });

  factory CartListModel.fromJson(Map<String, dynamic> json) => CartListModel(
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
  double? quantity;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? customerId;
  int? productId;
  String? productName;
  String? itemDescription;
  String? unitOfMeasure;

  Result({
    this.id,
    this.quantity,
    this.createdAt,
    this.updatedAt,
    this.customerId,
    this.productId,
    this.productName,
    this.itemDescription,
    this.unitOfMeasure,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    quantity: double.parse(json["quantity"].toString()),
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    customerId: json["customer_id"],
    productId: json["product_id"],
    productName: json["product_name"],
    itemDescription: json["item_description"],
    unitOfMeasure: json["unit_of_measure"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "quantity": quantity,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "customer_id": customerId,
    "product_id": productId,
    "product_name": productName,
    "item_description": itemDescription,
    "unit_of_measure": unitOfMeasure,
  };
}
