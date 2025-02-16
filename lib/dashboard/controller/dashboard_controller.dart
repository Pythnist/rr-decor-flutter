
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_upgrade_version/flutter_upgrade_version.dart';
import 'package:get/get.dart';
import 'package:rr_decor_flutter/model/banner_model.dart';
import 'package:rr_decor_flutter/model/collection_model.dart';
import 'package:rr_decor_flutter/services/startup_service.dart';

import '../../network/api_path.dart';
import '../../utility/utility.dart';

class DashboardController extends GetxController with WidgetsBindingObserver{


  bool isLoading = true;



  BannerModel? bannerModel = BannerModel(statusCode: 200, result: []);
  CollectionModel? collectionModel = CollectionModel(statusCode: 200, result: []);

  fetchData(){
    isLoading = true;
    update();
    StartUpService.networkProvider!.getCall(ApiPath.bannerurl).then((value) {

      if(value.body["status_code"] == HttpStatus.ok){
        bannerModel = BannerModel.fromJson(value.body);
      }else{
        bannerModel = BannerModel(statusCode: 200, result: []);
      }
      return StartUpService.networkProvider!.getCall(ApiPath.collectionUrl);
    }).then((value){
      if(value.body["status_code"] == HttpStatus.ok){
        collectionModel = CollectionModel.fromJson(value.body);
      }else{
        collectionModel = CollectionModel(statusCode: 200, result: []);
      }
      isLoading = false;
      update();
    }).catchError((error){
      isLoading = false;
      collectionModel = CollectionModel(statusCode: 200, result: []);
      bannerModel = BannerModel(statusCode: 200, result: []);
      update();
      Get.log("uou :${error.toString()}");
      throw error;
      throw error;
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    WidgetsBinding.instance.addObserver(this);
    fetchData();
    checkForUpdate();
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    // These are the callbacks
    switch (state) {
      case AppLifecycleState.resumed:
        checkForUpdate();
        print("Resume Service");
        //checkConnectionStatus();
        // widget is resumed
        break;
      case AppLifecycleState.inactive:


        print("InActive Service");
        // widget is inactive
        break;
      case AppLifecycleState.paused:

        print("paused Service");
        // widget is paused
        break;
      case AppLifecycleState.detached:

        print("detached Service");
        // widget is detached
        break;
      case AppLifecycleState.hidden:

        print("hidden Service");
    // TODO: Handle this case.
    }
  }


  void checkForUpdate() async {
    try{
      if (Platform.isAndroid) {
        InAppUpdateManager manager = InAppUpdateManager();
        AppUpdateInfo? appUpdateInfo = await manager.checkForUpdate();
        if (appUpdateInfo == null) return; //Exception
        if (appUpdateInfo.updateAvailability == UpdateAvailability.developerTriggeredUpdateInProgress) {
          ///If an in-app update is already running, resume the update.
          String? message = await manager.startAnUpdate(type: AppUpdateType.immediate);
          ///message return null when run update success
        } else if (appUpdateInfo.updateAvailability == UpdateAvailability.updateAvailable) {
          ///Update available
          if (appUpdateInfo.immediateAllowed) {
            debugPrint('Start an immediate update');
            String? message = await manager.startAnUpdate(type: AppUpdateType.immediate);
            ///message return null when run update success
          } else if (appUpdateInfo.flexibleAllowed) {
            debugPrint('Start an flexible update');
            String? message = await manager.startAnUpdate(type: AppUpdateType.flexible);
            ///message return null when run update success
          } else {
            debugPrint('Update available. Immediate & Flexible Update Flow not allow');
          }
        }
      }
    }catch(e){

    }
  }

}