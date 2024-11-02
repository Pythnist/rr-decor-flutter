// To parse this JSON data, do
//
//     final orderHistoryModel = orderHistoryModelFromJson(jsonString);

import 'dart:convert';

OrderHistoryModel orderHistoryModelFromJson(String str) => OrderHistoryModel.fromJson(json.decode(str));

String orderHistoryModelToJson(OrderHistoryModel data) => json.encode(data.toJson());

class OrderHistoryModel {
  int? statusCode;
  List<Result>? result;

  OrderHistoryModel({
    this.statusCode,
    this.result,
  });

  factory OrderHistoryModel.fromJson(Map<String, dynamic> json) => OrderHistoryModel(
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
  ShippingAddress? shippingAddress;
  String? modeOfTransport;
  String? refrence;
  String? salesman;
  double? quantity;
  DateTime? orderDate;
  String? orderId;
  int? lineNo;
  dynamic shippingDate;
  String? orderStatus;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? userId;
  int? productId;
  String? productName;
  dynamic productImage;

  Result({
    this.id,
    this.shippingAddress,
    this.modeOfTransport,
    this.refrence,
    this.salesman,
    this.quantity,
    this.orderDate,
    this.orderId,
    this.lineNo,
    this.shippingDate,
    this.orderStatus,
    this.createdAt,
    this.updatedAt,
    this.userId,
    this.productId,
    this.productName,
    this.productImage,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    shippingAddress: json["shipping_address"] == null ? null : ShippingAddress.fromJson(json["shipping_address"]),
    modeOfTransport: json["mode_of_transport"],
    refrence: json["refrence"],
    salesman: json["salesman"],
    quantity: double.parse(json["quantity"].toString()),
    orderDate: json["order_date"] == null ? null : DateTime.parse(json["order_date"]),
    orderId: json["order_id"],
    lineNo: json["line_no"],
    shippingDate: json["shipping_date"],
    orderStatus: json["order_status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    userId: json["user_id"],
    productId: json["product_id"],
    productName: json["product_name"],
    productImage: json["product_image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "shipping_address": shippingAddress?.toJson(),
    "mode_of_transport": modeOfTransport,
    "refrence": refrence,
    "salesman": salesman,
    "quantity": quantity,
    "order_date": orderDate?.toIso8601String(),
    "order_id": orderId,
    "line_no": lineNo,
    "shipping_date": shippingDate,
    "order_status": orderStatus,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "user_id": userId,
    "product_id": productId,
    "product_name": productName,
    "product_image": productImage,
  };
}

class ShippingAddress {
  int? id;
  String? companyName;
  String? fullAddress;
  String? state;
  String? district;
  String? pinCode;
  String? gstId;
  String? mobileNo;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? userId;

  ShippingAddress({
    this.id,
    this.companyName,
    this.fullAddress,
    this.state,
    this.district,
    this.pinCode,
    this.gstId,
    this.mobileNo,
    this.createdAt,
    this.updatedAt,
    this.userId,
  });

  factory ShippingAddress.fromJson(Map<String, dynamic> json) => ShippingAddress(
    id: json["id"],
    companyName: json["companyName"],
    fullAddress: json["full_address"],
    state: json["state"],
    district: json["district"],
    pinCode: json["pin_code"],
    gstId: json["gstId"],
    mobileNo: json["mobileNo"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    userId: json["user_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "companyName": companyName,
    "full_address": fullAddress,
    "state": state,
    "district": district,
    "pin_code": pinCode,
    "gstId": gstId,
    "mobileNo": mobileNo,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "user_id": userId,
  };
}
