
import 'dart:io';

import 'package:get/get.dart';
import 'package:rr_decor_flutter/model/banner_model.dart';
import 'package:rr_decor_flutter/model/collection_model.dart';
import 'package:rr_decor_flutter/services/startup_service.dart';

import '../../network/api_path.dart';
import '../../utility/utility.dart';

class DashboardController extends GetxController {


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
    fetchData();
    super.onInit();
  }

}