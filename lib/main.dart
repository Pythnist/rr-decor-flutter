import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rr_decor_flutter/pages/pages.dart';
import 'package:rr_decor_flutter/services/startup_service.dart';
import 'package:rr_decor_flutter/utility/app_constant.dart';
import 'package:ots/ots.dart';
import 'package:rr_decor_flutter/utility/styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return OTS(
      showNetworkUpdates: true,
      persistNoInternetNotification: false,
      child: GetMaterialApp(
        title: AppConstant.appName,
        //initialRoute: Routes,
        theme: Styles.themeLight,

        themeMode: ThemeMode.light,

        initialRoute: Routes.splashUrl,
        defaultTransition: Transition.fadeIn,
        opaqueRoute: Get.isOpaqueRouteDefault,
        popGesture: Get.isPopGestureEnable,
        enableLog: true,
        getPages: AppPages.pages,
        onInit: () async{
          await GetStorage().initStorage;
          //await Firebase.initializeApp();
          await Get.putAsync(() => StartUpService().init()).then((value) => Routes.splashUrl);
        },
        // builder: (context,widget){
        //   return SplashScreen();
        // },

      ),
    );
  }
}

