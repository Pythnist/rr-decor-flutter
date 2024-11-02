import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:rr_decor_flutter/model/product_model.dart';
import 'package:rr_decor_flutter/model/product_search_model.dart';

import '../../network/api_path.dart';
import '../../services/startup_service.dart';

class ProductSearchController extends GetxController {


  RxList<ProductSearchModel> _productModel = <ProductSearchModel>[].obs;
  RxBool _isLoading = false.obs;


  get isLoading => _isLoading.value;
  set isLoading(value) => _isLoading.value = value;
  get productModel => _productModel.value;
  set productModel(value) => _productModel.value = value;

  int? categoryId;

  TextEditingController? searchController;


  @override
  void onInit() {
    // TODO: implement onInit
    searchController = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    searchController!.dispose();
    super.dispose();
  }

  fetchData(){
    isLoading = true;
    update();
    StartUpService.networkProvider!.getCallQuery("${ApiPath.productSearch}",{"search":searchController!.text ?? ""}).then((value) {
      if(value.statusCode == HttpStatus.ok){
        productModel = value.body == null ? [] : List<ProductSearchModel>.from(value.body!.map((x) => ProductSearchModel.fromJson(x)));
      }else{
        productModel = [];
      }
      isLoading = false;
      update();
    }).catchError((error){
      isLoading = false;
      productModel = [];
      update();
      Get.log("uou :${error.toString()}");
      throw error;
      throw error;
    });
  }



}