import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ots/ots.dart';
import 'package:rr_decor_flutter/model/product_detail_model.dart';
import 'package:rr_decor_flutter/model/product_model.dart';
import 'package:rr_decor_flutter/pages/pages.dart';
import 'package:rr_decor_flutter/utility/utility.dart';

import '../../network/api_path.dart';
import '../../services/startup_service.dart';

class ProductDetailController extends GetxController {


  ProductDetailModel? productDetailModel;

  TextEditingController? quantityController;
  bool isLoading = true;

  int? productId;

  @override
  void onInit() {
    // TODO: implement onInit
    productId = Get.arguments[0];
    quantityController = TextEditingController();
    fetchData();
    super.onInit();
  }



  fetchData(){
    isLoading = true;
    update();
    StartUpService.networkProvider!.getCall("${ApiPath.productDetailUrl}${productId}").then((value) {
      if(value.body["status_code"] == HttpStatus.ok){
        productDetailModel = ProductDetailModel.fromJson(value.body);
      }else{
        productDetailModel = ProductDetailModel();
      }
      isLoading = false;
      update();
    }).catchError((error){
      isLoading = false;
      productDetailModel = ProductDetailModel();
      update();
      Get.log("uou :${error.toString()}");
      throw error;
      throw error;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    quantityController = TextEditingController();
    super.dispose();
  }


  dynamic cartFormData() => {
    "data":{
      "product_id":productId,
      "quantity":quantityController!.text ?? "0.00",
      "product_name":productDetailModel!.result!.itemDetails!.first.productName,
      "unit_of_measure":productDetailModel!.result!.itemDetails!.first.measureUnit,
      "item_description":productDetailModel!.result!.itemDetails!.first.itemDescription,
    }
  };

  addToCart(){
    showLoader(isModal: true);
    update();
    StartUpService.networkProvider!.getCommonCall(ApiPath.cartUrl,cartFormData()).then((value) {
      Get.log(value.bodyString!);
      hideLoader();
      if(value.body["status_code"] == HttpStatus.ok){
        Get.toNamed(Routes.checkoutUrl);
        bakeToast("Product is Added",type: ToastType.success);
      }else{
        //Utility.showSuccess(value.body["result"]);
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

  getCart(){
    showLoader(isModal: true);
    update();
    StartUpService.networkProvider!.getCall("${ApiPath.cartUrl}").then((value) {
      hideLoader();
      if(value.body["status_code"] == HttpStatus.ok){
        //Utility.showSuccess(value.body["result"]);
      }else{
        //Utility.showSuccess(value.body["result"]);
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