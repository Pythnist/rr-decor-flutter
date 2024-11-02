
import 'dart:io';

import 'package:get/get.dart';
import 'package:ots/ots.dart';
import 'package:rr_decor_flutter/model/login_model.dart';
import 'package:rr_decor_flutter/pages/pages.dart';
import 'package:rr_decor_flutter/utility/app_config.dart';

import '../../network/api_path.dart';
import '../../network/storage_repository.dart';
import '../../services/startup_service.dart';
import '../../utility/app_constant.dart';

class SplashController extends GetxController {

  LoginModel? loginModel;

  void redirect() {

    2.delay().then((value) {
      if(StartUpService.loginType == null){
        initLogin();
      }else {
        Get.offAllNamed(Routes.dashboardScreen);
      }
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    redirect();
    super.onInit();
  }


  void initLogin() {
    StartUpService.networkProvider!.getCommonCall(ApiPath.loginUrl, {
      "email": AppConfig.guestLoginEmail,
      "password": AppConfig.guestLoginPassword
    }).then((value) {
      update();
      if (value.body["status_code"] == HttpStatus.ok) {
        loginModel = LoginModel.fromJson(value.body);
        saveCredentials();
        //Get.toNamed(Routes.verifyOtpScreen,arguments: [signInModel,isEmailMode]);
      } else if (value.body["status_code"] == HttpStatus.badRequest) {
        Get.offAllNamed(Routes.loginUrl);
        //bakeToast(value.body["response"],type: ToastType.error);
      } else {

      }
    }).catchError((error) {

      Get.offAllNamed(Routes.loginUrl);
      bakeToast("Something went wrong", type: ToastType.error);
      throw error;
    });
  }


  void saveCredentials() async {
    await StorageRepository.saveOffline(
        AppConstant.offlineTokenKey, loginModel!.authToken);
    await StorageRepository.saveOffline(
        AppConstant.offlineRefreshTokenKey, loginModel!.jwtToken.refresh);
    await StorageRepository.saveOffline(
        AppConstant.offlineAccessTokenKey, loginModel!.jwtToken.access);
    await StorageRepository.saveOffline(
        AppConstant.offlineUserIdKey, loginModel!.userData.id);
    await StorageRepository.saveOffline(
        AppConstant.offlineNameKey, loginModel!.userData.name);
    await StorageRepository.saveOffline(
        AppConstant.offlineEmailKey, loginModel!.userData.email);
    await StorageRepository.saveOffline(
        AppConstant.offlineNumberKey, loginModel!.userData.mobileNo);
    await StorageRepository.saveOffline(
        AppConstant.offlineNavisionID, loginModel!.userData.naivisionId);
    await StorageRepository.saveOffline(
        AppConstant.offlineLoginType, AppConfig.guestLoginType);
    await StorageRepository.saveOffline(AppConstant.isLoggedInKey, true);
    Get.putAsync(() => StartUpService().init()).then((value) {
      Get.offAllNamed(Routes.dashboardScreen);
    });
  }
}