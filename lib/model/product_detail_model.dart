// To parse this JSON data, do
//
//     final productDetailModel = productDetailModelFromJson(jsonString);

import 'dart:convert';

ProductDetailModel productDetailModelFromJson(String str) => ProductDetailModel.fromJson(json.decode(str));

String productDetailModelToJson(ProductDetailModel data) => json.encode(data.toJson());

class ProductDetailModel {
  int? statusCode;
  Result? result;

  ProductDetailModel({
    this.statusCode,
    this.result,
  });

  factory ProductDetailModel.fromJson(Map<String, dynamic> json) => ProductDetailModel(
    statusCode: json["status_code"],
    result: json["result"] == null ? null : Result.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "status_code": statusCode,
    "result": result?.toJson(),
  };
}

class Result {
  List<ItemDetail>? itemDetails;
  List<RollNo>? rollNo;
  List<String>? modeOfTransport;

  Result({
    this.itemDetails,
    this.rollNo,
    this.modeOfTransport,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    itemDetails: json["item_details"] == null ? [] : List<ItemDetail>.from(json["item_details"]!.map((x) => ItemDetail.fromJson(x))),
    //rollNo: json["roll_no"] == null ? [] : List<RollNo>.from(json["roll_no"]!.map((x) => RollNo.fromJson(x))),
    rollNo: getStringRollNo(json),
    modeOfTransport: json["mode_of_transport"] == null ? [] : List<String>.from(json["mode_of_transport"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "item_details": itemDetails == null ? [] : List<dynamic>.from(itemDetails!.map((x) => x.toJson())),
    //"roll_no": rollNo == null ? [] : List<dynamic>.from(rollNo!.map((x) => x.toJson())),
    "mode_of_transport": modeOfTransport == null ? [] : List<dynamic>.from(modeOfTransport!.map((x) => x)),
  };
}

class ItemDetail {
  int? id;
  String? productName;
  String? itemDescription;
  String? itemNo;
  String? availableQuantity;
  String? unitPrice;
  String? unitCost;
  String? measureUnit;
  DateTime? projectedAvailableDate;
  dynamic projectedAvailableQty;
  dynamic image;
  DateTime? createdAt;
  DateTime? updatedAt;

  ItemDetail({
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

  factory ItemDetail.fromJson(Map<String, dynamic> json) => ItemDetail(
    id: json["id"],
    productName: json["product_name"],
    itemDescription: json["item_description"],
    itemNo: json["item_no"],
    availableQuantity: json["available_quantity"],
    unitPrice: json["unit_price"],
    unitCost: json["unit_cost"],
    measureUnit: json["measure_unit"],
    projectedAvailableDate: json["projected_available_date"] == null ? null : DateTime.parse(json["projected_available_date"]),
    projectedAvailableQty: json["projected_available_qty"],
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

class RollNo {
  String? entryNo;
  DateTime? postingDate;
  String? itemNo;
  String? locationCode;
  dynamic quantity;
  String? unitOfMeasureCode;
  String? lotNo;

  RollNo({
    this.entryNo,
    this.postingDate,
    this.itemNo,
    this.locationCode,
    this.quantity,
    this.unitOfMeasureCode,
    this.lotNo,
  });

  factory RollNo.fromJson(Map<String, dynamic> json) => RollNo(
    entryNo: json["Entry No"],
    postingDate: json["Posting Date"] == null ? null : DateTime.parse(json["Posting Date"]),
    itemNo: json["Item No"],
    locationCode: json["Location Code"],
    quantity: json["Quantity"],
    unitOfMeasureCode: json["Unit of Measure Code"],
    lotNo: json["Lot No"],
  );

  Map<String, dynamic> toJson() => {
    "Entry No": entryNo,
    "Posting Date": postingDate?.toIso8601String(),
    "Item No": itemNo,
    "Location Code": locationCode,
    "Quantity": quantity,
    "Unit of Measure Code": unitOfMeasureCode,
    "Lot No": lotNo,
  };
}


List<RollNo> getStringRollNo(dynamic data){
  List<RollNo> m = [];
  try{
    m = List<RollNo>.from(data["roll_no"]!.map((x) => RollNo.fromJson(x)));
  }catch(e){
    m = [];
  }
  return m;
}