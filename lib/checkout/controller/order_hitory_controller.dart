

import 'dart:io';

import 'package:get/get.dart';
import 'package:rr_decor_flutter/model/order_history_model.dart';

import '../../network/api_path.dart';
import '../../services/startup_service.dart';

class OrderHitoryController extends GetxController {

  OrderHistoryModel? orderHistoryModel = OrderHistoryModel(statusCode: 200, result: []);
  bool isLoading = true;

  @override
  void onInit() {
    // TODO: implement onInit
    fetchData();
    super.onInit();
  }

  fetchData(){
    isLoading = true;
    update();
    StartUpService.networkProvider!.getCall("${ApiPath.orderGetUrl}").then((value) {
      if(value.body["status_code"] == HttpStatus.ok){
        orderHistoryModel = OrderHistoryModel.fromJson(value.body);
      }else{
        orderHistoryModel = OrderHistoryModel(statusCode: 200, result: []);
      }
      isLoading = false;
      update();
    }).catchError((error){
      isLoading = false;
      orderHistoryModel = OrderHistoryModel(statusCode: 200, result: []);
      update();
      Get.log("uou :${error.toString()}");
      throw error;
      throw error;
    });
  }

}