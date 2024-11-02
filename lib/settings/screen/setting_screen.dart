import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rr_decor_flutter/settings/controller/setting_controller.dart';

import '../../pages/pages.dart';
import '../../services/startup_service.dart';
import '../../utility/app_constant.dart';
import '../../utility/utility.dart';

class SettingScreen extends GetView<SettingController> {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SettingController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: GetBuilder<SettingController>(
        init: controller,
        builder: (controller) => SettingView(controller: controller,),
      ),
    );
  }
}


class SettingView extends StatelessWidget {
  final SettingController? controller;
  const SettingView({Key? key,this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    color: Get.theme.primaryColorLight,
                    border: Border.all(color: Get.theme.primaryColor),
                    shape: BoxShape.circle,
                    // image: DecorationImage(
                    //     image: NetworkImage(AppConstant.dummyImage),
                    //     fit: BoxFit.fill
                    // ),
                  ),
                  child: Center(
                    child: Text("H",style: Get.theme.textTheme.headlineLarge!.copyWith(fontSize: 30,color: Colors.white),),
                  ),
                ),

                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  StartUpService.name ?? "",
                  textScaleFactor: Get.textScaleFactor,
                  style: Get.theme.textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 0.0,
                ),
                Text(
                  StartUpService.email ?? "",
                  textScaleFactor: Get.textScaleFactor,
                  style: Get.theme.textTheme.titleMedium!.copyWith(
                  ),
                )
              ],
            ),
            const SizedBox(height: 20.0,),
            Divider(),
            ListTile(
              dense: true,
              onTap: (){
                Get.toNamed(Routes.RrdecorwebView,arguments: [AppConstant.termAndConditionUrl,AppConstant.termAndConditionTitle]);
              },
              leading: Icon(Icons.policy),
              title: Text(
                "Terms & Conditions",
                style: Get.theme.textTheme.titleMedium,
                overflow: TextOverflow.ellipsis,
                textScaler: TextScaler.linear(Get.textScaleFactor),
                textAlign: TextAlign.start,
              ),
            ),
            Divider(),
            ListTile(
              dense: true,
              onTap: (){
                Get.toNamed(Routes.RrdecorwebView,arguments: [AppConstant.privacyPolicyUrl,AppConstant.privacyPolicyTitle]);
              },
              leading: Icon(Icons.policy),
              title: Text(
                "Privacy Policy",
                style: Get.theme.textTheme.titleMedium,
                overflow: TextOverflow.ellipsis,
                textScaler: TextScaler.linear(Get.textScaleFactor),
                textAlign: TextAlign.start,
              ),
            ),
            Divider(),
            ListTile(
              dense: true,
              onTap: (){
                Utility.showDialog("Delete Account",
                    "Are you sure you want to delete this account", (){
                  controller!.deactivateUser();
                });
              },
              leading: Icon(Icons.delete_outline,color: Colors.red,),
              title: Text(
                "Delete Account",
                style: Get.theme.textTheme.titleMedium!.copyWith(color: Colors.red),
                overflow: TextOverflow.ellipsis,
                textScaler: TextScaler.linear(Get.textScaleFactor),
                textAlign: TextAlign.start,
              ),
            ),
            const SizedBox(height: 20.0,),
            GestureDetector(
              onTap: () {
                Get.back();
                1.delay().then((value) => Utility.showLogoutDialog());
              },
              behavior: HitTestBehavior.opaque,
              child: Container(
                height: 50,
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(12.0))),
                child: Center(
                  child: Text(
                    "Logout",
                    textScaler: TextScaler.linear(Get.textScaleFactor),
                    overflow: TextOverflow.ellipsis,

                  ),
                ),
              ),
            ),
            const SizedBox(height: 10.0,),
            Align(
              alignment: Alignment.center,
              child: RichText(
                  overflow: TextOverflow.ellipsis,
                  textScaler: TextScaler.linear(Get.textScaleFactor),
                  textAlign: TextAlign.center,
                  text: TextSpan(text: "App Version: ",
                      style: Get.theme.textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w600),
                      children: <TextSpan>[
                        TextSpan(
                          text: "${StartUpService.appVersion}",
                          style: Get.theme.textTheme.titleSmall!,
                        )
                      ])),
            )
          ],
        ),
      ),
    );
  }
}
