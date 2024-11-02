

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rr_decor_flutter/model/ledger_model.dart';
import 'package:rr_decor_flutter/model/ledger_model.dart' as LedgerM;

import '../../network/api_path.dart';
import '../../services/startup_service.dart';

class LedgerController extends GetxController {

  TextEditingController? startDateController;
  TextEditingController? endDateController;

  DateTime? startDate;
  DateTime? endDate;


  @override
  void onInit() {
    // TODO: implement onInit
    startDateController = TextEditingController();
    endDateController = TextEditingController();
    super.onInit();
  }


  @override
  void dispose() {
    // TODO: implement dispose
    startDateController!.dispose();
    endDateController!.dispose();
    super.dispose();
  }

  LedgerModel? ledgerModel = LedgerModel(statusCode: 200, response: []);

  List<LedgerM.Response> ledgerList = [];
  bool isLoading = true;

  dynamic formData() => {
    "start_date":startDateController!.text,
    "end_date":endDateController!.text,
  };

  fetchData(){
    isLoading = true;
    update();
    StartUpService.networkProvider!.getCallQuery("${ApiPath.ledgerUrl}",formData()).then((value) {
      if(value.body["status_code"] == HttpStatus.ok){
        ledgerModel = LedgerModel.fromJson(value.body);
        ledgerList = ledgerModel!.response!.reversed.toList();
      }else{
        ledgerModel = LedgerModel(statusCode: 200, response: []);
      }
      isLoading = false;
      update();
    }).catchError((error){
      isLoading = false;
      ledgerModel = LedgerModel(statusCode: 200, response: []);
      update();
      Get.log("uou :${error.toString()}");
      throw error;
      throw error;
    });
  }




}