import 'dart:io';

import 'package:get/get.dart';
import 'package:rr_decor_flutter/model/product_model.dart';

import '../../network/api_path.dart';
import '../../services/startup_service.dart';

class ProductController extends GetxController {


  ProductModel? productModel = ProductModel(statusCode: 200, result: []);
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
    StartUpService.networkProvider!.getCall("${ApiPath.productUrl}${categoryId}").then((value) {
      if(value.body["status_code"] == HttpStatus.ok){
        productModel = ProductModel.fromJson(value.body);
      }else{
        productModel = ProductModel(statusCode: 200, result: []);
      }
      isLoading = false;
      update();
    }).catchError((error){
      isLoading = false;
      productModel = ProductModel(statusCode: 200, result: []);
      update();
      Get.log("uou :${error.toString()}");
      throw error;
      throw error;
    });
  }

}