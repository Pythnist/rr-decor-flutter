

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ots/ots.dart';

import '../../network/api_path.dart';
import '../../services/startup_service.dart';
import '../../utility/utility.dart';

class CreateAddressController extends GetxController {

  TextEditingController? fullNameController;
  TextEditingController? mobileController;
  TextEditingController? companyNameController;
  TextEditingController? addressController;
  TextEditingController? cityController;
  TextEditingController? stateController;
  TextEditingController? countryController;
  TextEditingController? zipCodeController;
  TextEditingController? gstController;


  void initController(){
    fullNameController = TextEditingController();
    mobileController  = TextEditingController();
    companyNameController  = TextEditingController();
    addressController = TextEditingController();
    cityController = TextEditingController();
    stateController = TextEditingController();
    countryController = TextEditingController();
    zipCodeController = TextEditingController();
    gstController = TextEditingController();
  }

  void disposeController(){
    fullNameController!.dispose();
    mobileController!.dispose();
    companyNameController!.dispose();
    addressController!.dispose();
    cityController!.dispose();
    stateController!.dispose();
    countryController!.dispose();
    zipCodeController!.dispose();
    gstController!.dispose();
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
    "companyName":companyNameController!.text ?? "",
    "full_address":addressController!.text ?? "",
    "state":stateController!.text ?? "",
    "district":cityController!.text ?? "",
    "pin_code":zipCodeController!.text ?? "",
    "gstId":gstController!.text ?? "",
    "mobileNo":mobileController!.text ?? "",
  };

  addAddress(){
    showLoader(isModal: true);
    update();
    StartUpService.networkProvider!.getCommonCall(ApiPath.addressUrl,formData()).then((value) {
      hideLoader();
      if(value.body["status_code"] == HttpStatus.ok){
        Get.back();

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