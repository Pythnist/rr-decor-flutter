

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rr_decor_flutter/utility/app_config.dart';
import 'package:rr_decor_flutter/utility/app_constant.dart';

import '../pages/pages.dart';
import '../services/startup_service.dart';


class GuestAuthMiddleware extends GetMiddleware {

  @override
  GetPage? onPageCalled(GetPage? page) {
    // TODO: implement onPageCalled
    return super.onPageCalled(page);
  }

    RouteSettings? redirect(String? route) {

    return (StartUpService.isLogin == true) ? null : RouteSettings(name: Routes.loginUrl);
  }

}