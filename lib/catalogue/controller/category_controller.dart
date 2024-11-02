import 'dart:io';

import 'package:get/get.dart';
import 'package:rr_decor_flutter/model/category_model.dart';

import '../../network/api_path.dart';
import '../../services/startup_service.dart';

class CategoryController extends GetxController {


  CategoryModel? categoryModel = CategoryModel(statusCode: 200, result: []);
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
    StartUpService.networkProvider!.getCall("${ApiPath.categoryUrl}${categoryId}").then((value) {
      if(value.body["status_code"] == HttpStatus.ok){
        categoryModel = CategoryModel.fromJson(value.body);
      }else{
        categoryModel = CategoryModel(statusCode: 200, result: []);
      }
      isLoading = false;
      update();
    }).catchError((error){
      isLoading = false;
      categoryModel = CategoryModel(statusCode: 200, result: []);

      update();
      Get.log("uou :${error.toString()}");
      throw error;
      throw error;
    });
  }

}