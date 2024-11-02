import 'dart:io';

import 'package:get/get.dart';
import 'package:rr_decor_flutter/model/sub_category_model.dart';

import '../../network/api_path.dart';
import '../../services/startup_service.dart';

class SubCategoryController extends GetxController {


  SubCategoryModel? categoryModel = SubCategoryModel(statusCode: 200, result: Result(data: []));
  bool isLoading = true;

  int? categoryId;

  @override
  void onInit() {
    // TODO: implement onInit
    categoryId = Get.arguments[0];
    fetchData();
    super.onInit();
  }

  fetchData(){
    isLoading = true;
    update();
    StartUpService.networkProvider!.getCall("${ApiPath.subCategoryUrl}${categoryId}").then((value) {
      if(value.body["status_code"] == HttpStatus.ok){
        categoryModel = SubCategoryModel.fromJson(value.body);
      }else{
        categoryModel = SubCategoryModel(statusCode: 200, result: Result(data: []));
      }
      isLoading = false;
      update();
    }).catchError((error){
      isLoading = false;
      categoryModel = SubCategoryModel(statusCode: 200, result: Result(data: []));

      update();
      Get.log("uou :${error.toString()}");
      throw error;
      throw error;
    });
  }

}