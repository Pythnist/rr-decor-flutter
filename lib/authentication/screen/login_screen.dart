import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rr_decor_flutter/authentication/controller/login_controller.dart';
import 'package:rr_decor_flutter/pages/pages.dart';
import 'package:rr_decor_flutter/services/startup_service.dart';
import 'package:rr_decor_flutter/utility/app_config.dart';
import 'package:rr_decor_flutter/utility/app_constant.dart';
import 'package:rr_decor_flutter/utility/custom_widget.dart';

import '../../utility/utility.dart';
import '../../utility/validators.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        actions: [
          TextButton(onPressed: (){
            if(StartUpService.loginType != null && StartUpService.loginType == AppConfig.guestLoginType){
              Get.offAllNamed(Routes.dashboardScreen);
            }else{
              controller.enableGuestMode = true;
              controller.initLogin();
            }
          }, child: Text("Skip",style: Get.theme.textTheme.titleMedium!.copyWith(color: Colors.blue),))
        ],
      ),
      body: GetBuilder<LoginController>(
        init: controller,
        builder: (controller) => SafeArea(
            child: LoginView(
          controller: controller,
        )),
      ),
    );
  }
}

class LoginView extends StatelessWidget {
  final LoginController? controller;
  final _formKey = GlobalKey<FormState>();
  LoginView({Key? key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      height: Get.height,
      width: Get.width,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppConstant.appLogo,
                        height: 100,
                        width: 100,
                        color: Colors.black,
                      ),

                    ],
                  ),
                  Text(
                    "Welcome 👋",
                    style: Get.theme.textTheme.titleLarge!
                        .copyWith(color: Color(0xff1A1C1E)),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    "Login",
                    style: Get.theme.textTheme.titleMedium!
                        .copyWith(color: Color(0xff6C7278)),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: controller!.emailController,
                    validator: AppValidators.noBlankValidatior,
                    style: Get.theme.textTheme.bodyMedium!.copyWith(color: Color(0xff1a1c1e)),
                    decoration: const InputDecoration(
                      hintText: 'Email',
                      labelText: 'Email *',
                      isDense: true,
                      //prefix: Icon(Icons.email),
                      fillColor: Colors.transparent,
                      border: OutlineInputBorder(

                        borderSide:
                        BorderSide(color: Color(0xff79747E), width: 0.5),
                        borderRadius: BorderRadius.all(
                            Radius.circular(AppConstant.borderRadius)),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Color(0xff79747E), width: 0.5),
                          borderRadius: BorderRadius.all(
                              Radius.circular(AppConstant.borderRadius))),
                      enabledBorder: const OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Color(0xff79747E), width: 0.5),
                          borderRadius: BorderRadius.all(
                              Radius.circular(AppConstant.borderRadius))),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: controller!.passwordController,
                    validator: AppValidators.noBlankValidatior,
                    obscureText: controller!.isPasswordVisible!,
                    style: Get.theme.textTheme.bodyMedium!.copyWith(color: Color(0xff1a1c1e)),
                    decoration: InputDecoration(
                      hintText: 'Password',
                      labelText: 'Password *',
                      isDense: true,
                      fillColor: Colors.transparent,
                      //prefix: Icon(Icons.lock),
                      border: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Color(0xff79747E), width: 0.5),
                        borderRadius: BorderRadius.all(
                            Radius.circular(AppConstant.borderRadius)),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Color(0xff79747E), width: 0.5),
                          borderRadius: BorderRadius.all(
                              Radius.circular(AppConstant.borderRadius))),
                      enabledBorder: const OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Color(0xff79747E), width: 0.5),
                          borderRadius: BorderRadius.all(
                              Radius.circular(AppConstant.borderRadius))),
                      suffixIcon: InkWell(
                        onTap: () {
                          controller!.isPasswordVisible =
                          !controller!.isPasswordVisible!;
                          controller!.update();
                        },
                        child: Icon(
                          controller!.isPasswordVisible!
                              ? Icons.visibility
                              : Icons.visibility_off_sharp,
                          color: Color(0xff79747E),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [_showForGetPassword()],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    width: Get.width,
                    child: CupertinoButton(
                        color: Colors.black,
                        child: Text(
                          "Login",
                          style: Get.theme.textTheme.titleMedium!
                              .copyWith(color: Colors.white),
                        ),
                        onPressed: () {
                          if(_formKey.currentState!.validate()){
                            controller!.enableGuestMode = false;
                            controller!.initLogin();
                          }
                        }),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  _or(),
                  const SizedBox(
                    height: 20.0,
                  ),



                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10.0),
              child: RichText(
                  textScaler: TextScaler.linear(Get.textScaleFactor),
                  overflow: TextOverflow.ellipsis,maxLines: 2,
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text:
                      "By tapping on Login, you are agreeing to ",
                      style: Get.theme.textTheme.bodySmall!.copyWith(color: Color(0xff6C7278),fontSize: 10),
                      children: <TextSpan>[
                        TextSpan(
                          text: "Terms of Service",
                          recognizer: TapGestureRecognizer()..onTap = () => Get.toNamed(Routes.RrdecorwebView,arguments: [AppConstant.termAndConditionUrl,AppConstant.termAndConditionTitle]),
                          style: Get.theme.textTheme.bodySmall!.copyWith(color: Colors.blue,fontWeight: FontWeight.w500,fontSize: 10),
                        ),
                        TextSpan(
                          text: " and ",
                          style: Get.theme.textTheme.bodySmall!.copyWith(color: Color(0xff6C7278),fontSize: 10),
                        ),
                        TextSpan(
                          text: "Privacy Policy",
                          recognizer: TapGestureRecognizer()..onTap = () => Get.toNamed(Routes.RrdecorwebView,arguments: [AppConstant.privacyPolicyUrl,AppConstant.privacyPolicyTitle]),
                          style: Get.theme.textTheme.bodySmall!.copyWith(color: Colors.blue,fontWeight: FontWeight.w500,fontSize: 10),
                        )
                      ])),
            )
          ],
        ),
      ),
    );
  }

  Widget _showLang() => Container(
        decoration: BoxDecoration(
            border: Border.all(color: Color(0xff79747E)),
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
        child: Row(
          children: [
            Image.asset(
              "assets/images/english.png",
              height: 17,
              width: 17,
            ),
            Text(
              "en",
              style: Get.theme.textTheme.bodyLarge!
                  .copyWith(color: Color(0xff1A1C1E)),
            ),
            Icon(
              Icons.keyboard_arrow_down_outlined,
              color: Color(0xff1A1C1E),
            )
          ],
        ),
      );

  Widget _showForGetPassword() => InkWell(
        onTap: () {
          Get.toNamed(Routes.forgetPassword);
        },
        child: Text(
          "Forget Password?",
          style: Get.theme.textTheme.titleMedium!
              .copyWith(color: Color(0xff1A1C1E)),
        ),
      );

  Widget _or() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {},
            child: Text(
              "Don't have an account?",
              style: Get.theme.textTheme.titleMedium!
                  .copyWith(color: Color(0xff6C7278)),
            ),
          ),
          InkWell(
            onTap: () {
              Get.toNamed(Routes.registerScreen);
            },
            child: Text(
              "Sign up",
              style: Get.theme.textTheme.titleMedium!.copyWith(
                  color: Color(0xff007e48), fontWeight: FontWeight.w500),
            ),
          )
        ],
      );

  Widget _ors() => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Flexible(child: Divider(color: Color(0xffEDF1F3),thickness: 1.0,)),
      Flexible(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              "Or",
              textScaleFactor: Get.textScaleFactor,
              style: Get.theme.textTheme.headlineMedium!.copyWith(fontSize: 12,color: Color(0xff1A1C1E)),
            ),
          )),
      Flexible(child: Divider(color: Color(0xffEDF1F3),thickness: 1.0,)),
    ],
  );
}
