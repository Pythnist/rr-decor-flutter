import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rr_decor_flutter/splash/controller/splash_controller.dart';
import 'package:rr_decor_flutter/utility/app_constant.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Scaffold(
      body: GetBuilder<SplashController>(
        init: controller,
        builder: (controller) => Container(
          height: Get.height,
          width: Get.width,
          child: Center(
            child: Image.asset(AppConstant.appLogo),
          ),
        ),
      ),
    );
  }
}
