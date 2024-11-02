import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rr_decor_flutter/authentication/controller/register_controller.dart';
import 'package:rr_decor_flutter/pages/pages.dart';

import '../../utility/app_constant.dart';
import '../../utility/validators.dart';


class RegisterScreen extends GetView<RegisterController> {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(RegisterController());
    return Scaffold(
      //extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: GetBuilder<RegisterController>(
        init: controller,
        builder: (controller) => RegisterView(controller: controller,),
      ),
    );
  }
}


class RegisterView extends StatelessWidget {
  final RegisterController? controller;
  final _formKey = GlobalKey<FormState>();
  RegisterView({Key? key,this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
      height: Get.height,
      width: Get.width,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
                "Register",
                style: Get.theme.textTheme.titleMedium!
                    .copyWith(color: Color(0xff6C7278)),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextFormField(
                controller: controller!.nameController,
                validator: AppValidators.noBlankValidatior,
                maxLines: 1,
                readOnly: false,

                style: Get.theme.textTheme.bodyMedium!.copyWith(color: Color(0xff1a1c1e)),
                decoration: InputDecoration(
                  hintText: 'Full Name',
                  labelText: 'Full Name',
                  hintStyle: Get.theme.textTheme.bodySmall,
                  labelStyle: Get.theme.textTheme.bodySmall,
                  isDense: true,
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
              const SizedBox(height: 15.0,),
              TextFormField(
                controller: controller!.emailController,
                validator: AppValidators.isEmailValidatior,
                maxLines: 1,
                readOnly: false,

                style: Get.theme.textTheme.bodyMedium!.copyWith(color: Color(0xff1a1c1e)),
                decoration: InputDecoration(
                  hintText: 'Email',
                  labelText: 'Email',
                  hintStyle: Get.theme.textTheme.bodySmall,
                  labelStyle: Get.theme.textTheme.bodySmall,
                  isDense: true,
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

              const SizedBox(height: 15.0,),
              TextFormField(
                controller: controller!.mobileController,
                validator: AppValidators.noBlankValidatior,
                maxLines: 1,maxLength: 10,
                readOnly: false,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                style: Get.theme.textTheme.bodyMedium!.copyWith(color: Color(0xff1a1c1e)),
                decoration: InputDecoration(
                  hintText: 'Mobile Number',
                  labelText: 'Mobile Number',
                  hintStyle: Get.theme.textTheme.bodySmall,
                  labelStyle: Get.theme.textTheme.bodySmall,
                  isDense: true,
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
              const SizedBox(height: 15.0,),
              TextFormField(
                controller: controller!.passwordController,
                validator: AppValidators.noBlankValidatior,
                maxLines: 1,
                readOnly: false,
                obscureText: !controller!.showPassword,
                style: Get.theme.textTheme.bodyMedium!.copyWith(color: Color(0xff1a1c1e)),
                decoration: InputDecoration(
                  hintText: 'Enter Password',
                  labelText: 'Password',
                  suffix: InkWell(
                    onTap: (){
                      controller!.showPassword = !controller!.showPassword;
                      controller!.update();
                    },
                    child: Icon(!controller!.showPassword ? Icons.visibility : Icons.visibility_off,size: 20,color: Colors.black,),
                  ),
                  hintStyle: Get.theme.textTheme.bodySmall,
                  labelStyle: Get.theme.textTheme.bodySmall,
                  isDense: true,
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
              const SizedBox(height: 15.0,),
              TextFormField(
                controller: controller!.confirmPasswordController,
                validator: (String? value) => AppValidators.validateConfirmPassword(value, controller!.passwordController!.text),
                maxLines: 1,
                readOnly: false,
                obscureText: !controller!.showConfirmPassword,
                style: Get.theme.textTheme.bodyMedium!.copyWith(color: Color(0xff1a1c1e)),
                decoration: InputDecoration(
                  hintText: 'Enter Confirm Password',
                  labelText: 'Confirm Password',
                  hintStyle: Get.theme.textTheme.bodySmall,
                  labelStyle: Get.theme.textTheme.bodySmall,
                  isDense: true,

                  suffix: InkWell(
                    onTap: (){
                      controller!.showConfirmPassword = !controller!.showConfirmPassword;
                      controller!.update();
                    },
                    child: Icon(!controller!.showConfirmPassword ? Icons.visibility : Icons.visibility_off,size: 20,color: Colors.black,),
                  ),
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


              const SizedBox(height: 20.0,),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: Get.width,
                  child: CupertinoButton(
                      //borderRadius: BorderRadius.all(Radius.circular(25.0)),
                      color: Colors.black,
                      child: Text(
                        "Register",
                        style: Get.theme.textTheme.titleSmall!
                            .copyWith(color: Colors.white),
                      ),
                      onPressed: () {
                        if(_formKey.currentState!.validate()){
                          controller!.initRegister();
                        }
                      }),
                ),
              ),
              const SizedBox(height: 10.0,),
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
      ),
    );
  }

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
