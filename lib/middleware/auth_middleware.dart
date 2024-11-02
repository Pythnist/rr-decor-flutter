

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/pages.dart';
import '../services/startup_service.dart';
import '../utility/app_config.dart';


class AuthMiddleware extends GetMiddleware {

  @override
  GetPage? onPageCalled(GetPage? page) {
    // TODO: implement onPageCalled
    return super.onPageCalled(page);
  }

  RouteSettings? redirect(String? route) {

    return (StartUpService.isLogin == true && StartUpService.loginType == AppConfig.userLoginType) ? null : RouteSettings(name: Routes.loginUrl);
  }

}