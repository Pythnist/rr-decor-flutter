import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:rr_decor_flutter/authentication/controller/forget_password_confirm_controller.dart';

import '../../utility/app_constant.dart';
import '../../utility/validators.dart';

class ForgetPasswordConfirmScreen extends GetView<ForgetPasswordConfirmController> {
  const ForgetPasswordConfirmScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordConfirmController());
    return Scaffold(
      appBar: AppBar(

      ),
      body: GetBuilder<ForgetPasswordConfirmController>(
        init: controller,
        builder: (controller) => ForgetPasswordView(controller: controller,),
      ),
    );
  }
}


class ForgetPasswordView extends StatelessWidget {
  final ForgetPasswordConfirmController? controller;
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
                "Reset Password",
                style: Get.theme.textTheme.titleMedium!
                    .copyWith(color: Color(0xff6C7278)),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Padding(padding: EdgeInsets.symmetric(horizontal: 00.0),child: PinCodeTextField(
                length: 6,
                obscureText: false,
                controller: controller!.otpController,
                animationType: AnimationType.fade,
                keyboardType: TextInputType.number,
                autoDisposeControllers: false,

                mainAxisAlignment: MainAxisAlignment.spaceAround,
                pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    fieldHeight: 40,
                    fieldWidth: 40,
                    borderWidth: 0.5,
                    activeBorderWidth: 0.5,
                    inactiveBorderWidth: 0.5,
                    selectedBorderWidth: 0.5,
                    selectedColor: Colors.black,
                    selectedFillColor: Colors.white60,
                    disabledColor: Colors.black,
                    activeFillColor: Colors.white60,
                    inactiveColor: Colors.black,
                    activeColor: Colors.black,
                    inactiveFillColor: Colors.white60,
                    errorBorderColor: Colors.black),
                animationDuration: Duration(milliseconds: 300),
                backgroundColor: Colors.transparent,
                enableActiveFill: true,
                onCompleted: (v) {
                  print("Completed");
                },
                onChanged: (value) {},
                beforeTextPaste: (text) {
                  print("Allowing to paste $text");
                  //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                  //but you can show anything you want here, like your pop up saying wrong paste format or etc
                  return true;
                },
                appContext: Get.context!,
              ),),
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
                child: CupertinoButton(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
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
              const SizedBox(height: 10.0,),

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
