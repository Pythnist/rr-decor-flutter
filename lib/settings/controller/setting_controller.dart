

import 'dart:io';

import 'package:get/get.dart';
import 'package:ots/ots.dart';

import '../../network/api_path.dart';
import '../../services/startup_service.dart';
import '../../utility/utility.dart';

class SettingController extends GetxController {



  deactivateUser(){
    showLoader(isModal: true);
    update();
    StartUpService.networkProvider!.getCall("${ApiPath.userDelete}").then((value) {
      if(value.body["status_code"] == HttpStatus.ok){
        Utility.loggedOut();
        Utility.showSuccess(value.body["response"]);
      }else{
        Utility.showSuccess(value.body["response"]);
      }
      hideLoader();
      update();
    }).catchError((error){
      hideLoader();
      update();
      throw error;

    });
  }

}