import 'dart:io';

import 'package:get/get.dart';
import 'package:rr_decor_flutter/model/discontinue_model.dart';

import '../../network/api_path.dart';
import '../../services/startup_service.dart';

class DiscontinueListController extends GetxController {


  DiscontinueModel? discontinueModel = DiscontinueModel(statusCode: 200, response: []);
  bool isLoading = true;

  int? categoryId;

  @override
  void onInit() {
    // TODO: implement onInit

    fetchData();
    super.onInit();
  }

  fetchData(){
    isLoading = true;
    update();
    StartUpService.networkProvider!.getCall("${ApiPath.discontinueModelUrl}").then((value) {
      if(value.body["status_code"] == 400){
        discontinueModel = DiscontinueModel.fromJson(value.body);
      }else{
        discontinueModel = DiscontinueModel(statusCode: 200, response: []);
      }
      isLoading = false;
      update();
    }).catchError((error){
      isLoading = false;
      discontinueModel = DiscontinueModel(statusCode: 200, response: []);
      update();
      Get.log("uou :${error.toString()}");
      throw error;
      throw error;
    });
  }

}