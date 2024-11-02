

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ots/ots.dart';

import '../../network/api_path.dart';
import '../../pages/pages.dart';
import '../../services/startup_service.dart';
import '../../utility/utility.dart';

class ForgetPasswordController extends GetxController {

  TextEditingController? emailController;


  bool showPassword = false;
  bool showConfirmPassword = false;


  void initController(){
    emailController = TextEditingController();


  }

  void disposeController(){
    emailController!.dispose();

  }


  @override
  void onInit() {
    // TODO: implement onInit
    initController();
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    disposeController();
    super.dispose();
  }

  dynamic formData() => {
    "email":emailController!.text.toLowerCase() ?? "",
  };

  initRegister(){
    showLoader(isModal: true);
    update();
    StartUpService.networkProvider!.getCommonCall(ApiPath.forgetPasswordOtp,formData()).then((value) {
      hideLoader();
      if(value.body["status_code"] == HttpStatus.ok){
        Get.offAllNamed(Routes.forgetPasswordConfirm,arguments: [emailController!.text]);
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

}