

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ots/ots.dart';

import '../../network/api_path.dart';
import '../../pages/pages.dart';
import '../../services/startup_service.dart';
import '../../utility/utility.dart';

class RegisterController extends GetxController {

  TextEditingController? nameController;
  TextEditingController? emailController;
  TextEditingController? confirmPasswordController;
  TextEditingController? passwordController;
  TextEditingController? mobileController;

  bool showPassword = false;
  bool showConfirmPassword = false;


  void initController(){
    nameController = TextEditingController();
    emailController = TextEditingController();
    mobileController  = TextEditingController();
    confirmPasswordController  = TextEditingController();
    passwordController = TextEditingController();
    mobileController = TextEditingController();

  }

  void disposeController(){
    nameController!.dispose();
    mobileController!.dispose();
    confirmPasswordController!.dispose();
    passwordController!.dispose();
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
    "data":{
      "name":nameController!.text ?? "",
      "email":emailController!.text.toLowerCase() ?? "",
      "confirm_password":confirmPasswordController!.text ?? "",
      "password":confirmPasswordController!.text ?? "",
      "mobile_number":mobileController!.text ?? "",
    }
  };

  initRegister(){
    showLoader(isModal: true);
    update();
    StartUpService.networkProvider!.getCommonCall(ApiPath.register,formData()).then((value) {
      hideLoader();
      if(value.body["status_code"] == HttpStatus.ok){
        Get.offAllNamed(Routes.verifyScreen,arguments: [emailController!.text]);
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