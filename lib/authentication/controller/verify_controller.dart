
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ots/ots.dart';

import '../../network/api_path.dart';
import '../../pages/pages.dart';
import '../../services/startup_service.dart';
import '../../utility/utility.dart';

class VerifyController extends GetxController {


  String? email;

  TextEditingController? otpController;


  @override
  void onInit() {
    // TODO: implement onInit
    otpController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    email = Get.arguments[0];
    otpController!.dispose();
    super.dispose();
  }


  dynamic formData() => {

    "email":email,
    "otp":otpController!.text ?? "",
  };

  initVerification(){
    showLoader(isModal: true);
    update();
    StartUpService.networkProvider!.getCommonCall(ApiPath.verifyEmail,formData()).then((value) {
      hideLoader();
      if(value.body["status_code"] == HttpStatus.ok){
        Get.offAllNamed(Routes.loginUrl);
        Utility.showSuccess(value.body["result"]);
      }else{
        Utility.showSuccess(value.body["result"]);
      }
      update();
    }).catchError((error){
      hideLoader();
      update();
      Get.log("uou :${error.toString()}");
      throw error;
      throw error;
    });
  }



  void resendOtp() {
    showLoader(isModal: true);
    update();
    StartUpService.networkProvider!.getCommonCall(ApiPath.resendOTp,formData()).then((value) {
      hideLoader();
      if(value.body["status_code"] == HttpStatus.ok){
        Utility.showSuccess(value.body["result"]);
      }else{
        Utility.showSuccess(value.body["result"]);
      }
      update();
    }).catchError((error){
      hideLoader();
      update();

      throw error;
      throw error;
    });
  }

}