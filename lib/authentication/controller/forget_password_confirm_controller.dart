

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ots/ots.dart';

import '../../network/api_path.dart';
import '../../pages/pages.dart';
import '../../services/startup_service.dart';
import '../../utility/utility.dart';

class ForgetPasswordConfirmController extends GetxController {

  TextEditingController? otpController;
  TextEditingController? confirmPasswordController;
  TextEditingController? passwordController;


  bool showPassword = false;
  bool showConfirmPassword = false;


  String? email;


  void initController(){
    otpController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();


  }

  void disposeController(){
    otpController!.dispose();
    passwordController!.dispose();
    confirmPasswordController!.dispose();
  }


  @override
  void onInit() {
    // TODO: implement onInit
    initController();
    email = Get.arguments[0];
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    disposeController();
    super.dispose();
  }

  dynamic formData() => {
    "email":email!.toLowerCase() ?? "",
    "otp":otpController!.text,
    "new_password":passwordController!.text,
    "re_new_password":confirmPasswordController!.text
  };

  initRegister(){
    showLoader(isModal: true);
    update();
    StartUpService.networkProvider!.getCommonCall(ApiPath.forgetPasswordConfirm,formData()).then((value) {
      hideLoader();
      if(value.body["status_code"] == HttpStatus.ok){
        Get.offAllNamed(Routes.loginUrl);
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