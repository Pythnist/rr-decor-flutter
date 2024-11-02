


import 'package:get/get.dart';

class ImageNotUploadException implements Exception{


  ImageNotUploadException();

  String? errorLog(){
    Get.log("imageNotUpload".tr);
    return "imageNotUpload".tr;
  }
}