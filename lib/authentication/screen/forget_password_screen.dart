import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rr_decor_flutter/authentication/controller/forget_password_controller.dart';

import '../../utility/app_constant.dart';
import '../../utility/validators.dart';


class ForgetPasswordScreen extends GetView<ForgetPasswordController> {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(

      ),
      body: GetBuilder<ForgetPasswordController>(
        init: controller,
        builder: (controller) => ForgetPasswordView(controller: controller,),
      ),
    );
  }
}

class ForgetPasswordView extends StatelessWidget {
  final ForgetPasswordController? controller;
  final _formKey = GlobalKey<FormState>();
  ForgetPasswordView({Key? key,this.controller}) : super(key: key);

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
                "Forget Password",
                style: Get.theme.textTheme.titleMedium!
                    .copyWith(color: Color(0xff6C7278)),
              ),
              const SizedBox(
                height: 20.0,
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





              const SizedBox(height: 20.0,),
              Align(
                alignment: Alignment.center,
                child: CupertinoButton(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    color: Colors.black,
                    child: Text(
                      "Send OTP",
                      style: Get.theme.textTheme.titleSmall!
                          .copyWith(color: Colors.white),
                    ),
                    onPressed: () {
                      if(_formKey.currentState!.validate()){
                        controller!.initRegister();
                      }
                    }),
              ),

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

