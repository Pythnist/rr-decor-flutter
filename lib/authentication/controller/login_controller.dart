


import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ots/ots.dart';
import 'package:rr_decor_flutter/model/login_model.dart';
import 'package:rr_decor_flutter/network/storage_repository.dart';
import 'package:rr_decor_flutter/pages/pages.dart';

import '../../network/api_path.dart';
import '../../services/startup_service.dart';
import '../../utility/app_config.dart';
import '../../utility/app_constant.dart';
import '../../utility/utility.dart';

class LoginController extends GetxController{

  TextEditingController? emailController;
  TextEditingController? passwordController;

  bool? isPasswordVisible = true;

  LoginModel? loginModel;

  bool enableGuestMode = false;




  @override
  void onInit() {
    // TODO: implement onInit
    emailController = TextEditingController();
    passwordController = TextEditingController();
    emailController!.text = "rohit@rrdecor.com";
    passwordController!.text = "rrd@123";
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailController!.dispose();
    passwordController!.dispose();
    super.dispose();
  }

  void initLogin(){

    showLoader(isModal: true);
    update();

    StartUpService.networkProvider!.getCommonCall(ApiPath.loginUrl, {
      "email":enableGuestMode ? AppConfig.guestLoginEmail : emailController!.text,
      "password":enableGuestMode ? AppConfig.guestLoginPassword :passwordController!.text
    }).then((value) {
      hideLoader();
      update();
      if(value.body["status_code"] ==  HttpStatus.ok){
          bakeToast("Logged In",type: ToastType.success);
          loginModel = LoginModel.fromJson(value.body);
          saveCredentials();
        //Get.toNamed(Routes.verifyOtpScreen,arguments: [signInModel,isEmailMode]);
      }else if(value.body["status_code"] == HttpStatus.badRequest){
        Utility.showError(value.body["response"]);
        //bakeToast(value.body["response"],type: ToastType.error);
      }else{
        Utility.showError("Something Went Wrong");
      }
    }).catchError((error){
      hideLoader();
      update();
      bakeToast("Something went wrong",type: ToastType.error);
      throw error;
    });
  }



  void saveCredentials() async{
    await StorageRepository.saveOffline(AppConstant.offlineTokenKey, loginModel!.authToken);
    await StorageRepository.saveOffline(AppConstant.offlineRefreshTokenKey, loginModel!.jwtToken.refresh);
    await StorageRepository.saveOffline(AppConstant.offlineAccessTokenKey, loginModel!.jwtToken.access);
    await StorageRepository.saveOffline(AppConstant.offlineUserIdKey, loginModel!.userData.id);
    await StorageRepository.saveOffline(AppConstant.offlineNameKey, loginModel!.userData.name);
    await StorageRepository.saveOffline(AppConstant.offlineEmailKey, loginModel!.userData.email);
    await StorageRepository.saveOffline(AppConstant.offlineNumberKey, loginModel!.userData.mobileNo);
    await StorageRepository.saveOffline(AppConstant.offlineNavisionID, loginModel!.userData.naivisionId);
    await StorageRepository.saveOffline(
        AppConstant.offlineLoginType, enableGuestMode ? AppConfig.guestLoginType : AppConfig.userLoginType);
    await StorageRepository.saveOffline(AppConstant.isLoggedInKey, true);
    Get.putAsync(() => StartUpService().init()).then((value) {
      Get.offAllNamed(Routes.dashboardScreen);
    });
  }


}