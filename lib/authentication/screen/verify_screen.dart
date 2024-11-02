import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:rr_decor_flutter/authentication/controller/verify_controller.dart';
import 'package:rr_decor_flutter/utility/app_constant.dart';

class VerifyScreen extends GetView<VerifyController> {
  const VerifyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Verification"),
      ),
      body: GetBuilder<VerifyController>(
        init: controller,
        builder: (controller) => VerifyOtpView(controller: controller,),
      ),
    );
  }
}


class VerifyOtpView extends StatelessWidget {
  final VerifyController? controller;
  const VerifyOtpView({Key? key,this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Container(
      height: Get.height,
      width: Get.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: Container(
            height: Get.height,
            width: Get.width,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(AppConstant.appLogo,width: 200,height: 200,),
                  const SizedBox(height: 30.0,),
                  Text(
                    "Verify With One Time Password",
                    textScaler: TextScaler.linear(Get.textScaleFactor),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: Get.theme.textTheme.titleMedium!.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10.0,),
                  RichText(
                      textScaler: TextScaler.linear(Get.textScaleFactor),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      text: TextSpan(
                      text: "Enter The code you recieved at ",

                      style: Get.theme.textTheme.titleMedium!.copyWith(
                          color: Colors.black,fontSize: 10
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: "${controller!.email}",
                          style: Get.theme.textTheme.titleMedium!.copyWith(
                              color: Colors.blue,fontSize: 10
                          ),

                        )
                      ]
                  )),
                  const SizedBox(height: 10.0,),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 50.0),child: PinCodeTextField(
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

                  const SizedBox(height: 0.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Haven’t received the OTP? ",
                        textScaler: TextScaler.linear(Get.textScaleFactor),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: Get.theme.textTheme.titleSmall!.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          controller!.resendOtp();
                        },
                        child: Text("Resend",
                          textScaler: TextScaler.linear(Get.textScaleFactor),
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: Get.theme.textTheme.titleSmall!.copyWith(color: Colors.blue),),
                      ),
                    ],
                  ),
                ],
              ),
            ),)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.0),
            child: CupertinoButton(
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
                color: Colors.black,
                child: Text(
                  "Verify",
                  style: Get.theme.textTheme.titleSmall!
                      .copyWith(color: Colors.white),
                ),
                onPressed: () {
                  controller!.initVerification();
                }),

          ),
          const SizedBox(height: 10.0,),

        ],
      ),
    ));
  }
}

