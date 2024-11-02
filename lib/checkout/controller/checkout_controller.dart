


import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ots/ots.dart';
import 'package:rr_decor_flutter/model/address_list_model.dart';
import 'package:rr_decor_flutter/model/address_list_model.dart' as AddressModel;
import 'package:rr_decor_flutter/model/cart_list_model.dart';
import 'package:rr_decor_flutter/pages/pages.dart';

import '../../network/api_path.dart';
import '../../services/startup_service.dart';
import '../../utility/utility.dart';

class CheckoutController extends GetxController {


  TextEditingController? transportModeController;
  TextEditingController? salesManController;
  TextEditingController? orderReferenceController;
  TextEditingController? selectedAddressController;


  CartListModel cartListModel = CartListModel(result: [],statusCode: 200);

  AddressListModel? addressListModel = AddressListModel(result: AddressModel.Result(data: [],modeOfTransport: []));
  AddressModel.Datum? selectedAddress;
  bool isLoading = true;

  getCart(){
    isLoading = true;
    update();
    StartUpService.networkProvider!.getCall("${ApiPath.cartUrl}").then((value) {
      if(value.body["status_code"] == HttpStatus.ok){
        cartListModel = CartListModel.fromJson(value.body);
        //Utility.showSuccess(value.body["result"]);
      }else{
        //Utility.showSuccess(value.body["result"]);
      }
      isLoading = false;
      update();
      return StartUpService.networkProvider!.getCall("${ApiPath.addressUrl}");
    }).then((value){
      if(value.body["status_code"] == HttpStatus.ok){
        addressListModel = AddressListModel.fromJson(value.body);
        setDefaultAddress();
        //Utility.showSuccess(value.body["result"]);
      }else{
        //Utility.showSuccess(value.body["result"]);
      }
      isLoading = false;
      update();
    }).catchError((error){
      isLoading = false;
      update();
      throw error;

    });
  }

  getCartRefresh(){
    showLoader(isModal: true);
    update();
    StartUpService.networkProvider!.getCall("${ApiPath.cartUrl}").then((value) {
      if(value.body["status_code"] == HttpStatus.ok){
        cartListModel = CartListModel.fromJson(value.body);
        //Utility.showSuccess(value.body["result"]);
      }else{
        //Utility.showSuccess(value.body["result"]);
      }
      hideLoader();
      update();
      return StartUpService.networkProvider!.getCall("${ApiPath.addressUrl}");
    }).then((value){
      if(value.body["status_code"] == HttpStatus.ok){
        addressListModel = AddressListModel.fromJson(value.body);
        setDefaultAddress();
        //Utility.showSuccess(value.body["result"]);
      }else{
        //Utility.showSuccess(value.body["result"]);
      }
      hideLoader();
      update();
    }).catchError((error){
      hideLoader();
      update();
      throw error;

    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    transportModeController = TextEditingController();
    salesManController = TextEditingController();
    orderReferenceController = TextEditingController();
    selectedAddressController = TextEditingController();
    getCart();
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    transportModeController!.dispose();
    salesManController!.dispose();
    orderReferenceController!.dispose();
    selectedAddressController!.dispose();
    super.dispose();
  }


  dynamic checkOutFormData() => {
    "mode_of_transport":transportModeController!.text ?? "",
    "shipping_address":selectedAddress!.id,
    "refrence":orderReferenceController!.text ?? "",
    "salesman":salesManController!.text ?? ""
  };

  makeCheckout(){
    showLoader(isModal: true);
    update();
    StartUpService.networkProvider!.getCommonCall(ApiPath.checkOutUrl,checkOutFormData()).then((value) {
      hideLoader();
      if(value.body["status_code"] == HttpStatus.ok){
        Get.offAllNamed(Routes.checkoutSuccessUrl);
        Utility.showSuccess(value.body["result"]);
      }else{
        Utility.showSuccess(value.body["result"]);
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

  deleteItem(int index){
    showLoader(isModal: true);
    update();
    StartUpService.networkProvider!.getDeleteQuery("${ApiPath.cartUrl}${cartListModel.result!.elementAt(index).id}/").then((value) {

      if(value.body["status_code"] == HttpStatus.ok){
        cartListModel.result!.removeAt(index);
        Get.back();
        Utility.showSuccess(value.body["result"]);
      }else{
        Utility.showSuccess(value.body["result"]);
      }
      hideLoader();
      update();
    }).catchError((error){
      hideLoader();
      update();

      throw error;
      throw error;
    });
  }

  void setDefaultAddress(){
    try{
      if(addressListModel!.result!.data!.isNotEmpty){
        selectedAddress = addressListModel!.result!.data!.first;
        selectedAddressController!.text = "${addressListModel!.result!.data!.first.fullAddress},${addressListModel!.result!.data!.first.district!}, ${addressListModel!.result!.data!.first.state!}, ${addressListModel!.result!.data!.first.pinCode!}";
      }
    }catch(e){
      selectedAddress = null;
      selectedAddressController!.clear();
      Get.log("Hola Error ${e}");
    }
  }

}