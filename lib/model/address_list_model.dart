// To parse this JSON data, do
//
//     final addressListModel = addressListModelFromJson(jsonString);

import 'dart:convert';

AddressListModel addressListModelFromJson(String str) => AddressListModel.fromJson(json.decode(str));

String addressListModelToJson(AddressListModel data) => json.encode(data.toJson());

class AddressListModel {
  int? statusCode;
  Result? result;

  AddressListModel({
    this.statusCode,
    this.result,
  });

  factory AddressListModel.fromJson(Map<String, dynamic> json) => AddressListModel(
    statusCode: json["status_code"],
    result: json["result"] == null ? null : Result.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "status_code": statusCode,
    "result": result?.toJson(),
  };
}

class Result {
  List<Datum>? data;
  List<String>? modeOfTransport;

  Result({
    this.data,
    this.modeOfTransport,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    modeOfTransport: json["mode_of_transport"] == null ? [] : List<String>.from(json["mode_of_transport"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "mode_of_transport": modeOfTransport == null ? [] : List<dynamic>.from(modeOfTransport!.map((x) => x)),
  };
}

class Datum {
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

  Datum({
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

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
