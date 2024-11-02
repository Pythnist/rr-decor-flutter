// To parse this JSON data, do
//
//     final ledgerModel = ledgerModelFromJson(jsonString);

import 'dart:convert';

LedgerModel ledgerModelFromJson(String str) => LedgerModel.fromJson(json.decode(str));

String ledgerModelToJson(LedgerModel data) => json.encode(data.toJson());

class LedgerModel {
  int? statusCode;
  List<Response>? response;

  LedgerModel({
    this.statusCode,
    this.response,
  });

  factory LedgerModel.fromJson(Map<String, dynamic> json) => LedgerModel(
    statusCode: json["status_code"],
    response: json["response"] == null ? [] : List<Response>.from(json["response"]!.map((x) => Response.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status_code": statusCode,
    "response": response == null ? [] : List<dynamic>.from(response!.map((x) => x.toJson())),
  };
}

class Response {
  String? entryNo;
  String? customerNumber;
  DateTime? postingDate;
  String? documentType;
  String? documentNumber;
  double? debitAmount;
  double? creditAmount;
  double? totalBalance;

  Response({
    this.entryNo,
    this.customerNumber,
    this.postingDate,
    this.documentType,
    this.documentNumber,
    this.debitAmount,
    this.creditAmount,
    this.totalBalance,
  });

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    entryNo: json["entry_no"],
    customerNumber: json["customer_number"],
    postingDate: json["posting_date"] == null ? null : DateTime.parse(json["posting_date"]),
    documentType: json["document_type"],
    documentNumber: json["document_number"],
    debitAmount: double.parse(json["debit_amount"].toString()),
    creditAmount: double.parse(json["credit_amount"].toString()),
    totalBalance: json["total_balance"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "entry_no": entryNo,
    "customer_number": customerNumber,
    "posting_date": postingDate?.toIso8601String(),
    "document_type": documentType,
    "document_number": documentNumber,
    "debit_amount": debitAmount,
    "credit_amount": creditAmount,
    "total_balance": totalBalance,
  };
}
