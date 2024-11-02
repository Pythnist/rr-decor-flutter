


import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ots/ots.dart';

import '../../network/api_path.dart';
import '../../services/startup_service.dart';
import '../../utility/utility.dart';
import '../screen/contact_screen.dart';

class ContactController extends GetxController {

  TextEditingController? nameController;
  TextEditingController? emailIDController;
  TextEditingController? contactNumber;
  TextEditingController? descriptionController;


  void initController(){
    nameController = TextEditingController();
    emailIDController  = TextEditingController();
    contactNumber  = TextEditingController();
    descriptionController = TextEditingController();

  }

  void disposeController(){
    nameController!.dispose();
    emailIDController!.dispose();
    contactNumber!.dispose();
    descriptionController!.dispose();

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
      "email":emailIDController!.text ?? "",
      "contact_number":contactNumber!.text ?? "",
      "description":descriptionController!.text ?? "",

    }
  };

  addAddress(){
    showLoader(isModal: true);
    update();
    StartUpService.networkProvider!.getCommonCall(ApiPath.contactIs,formData()).then((value) {
      hideLoader();
      update();
      if(value.body["status_code"] == HttpStatus.ok){
        Get.defaultDialog(title: "Contact",content: ContactSuccessDialog(),barrierDismissible: false);

      }else{
        Utility.showSuccess(value.body["result"]);
      }

    }).catchError((error){
      hideLoader();
      update();
      Get.log("uou :${error.toString()}");
      throw error;
      throw error;
    });
  }
}