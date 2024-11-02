import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:rr_decor_flutter/contact/controller/contact_controller.dart';
import 'package:rr_decor_flutter/pages/pages.dart';

import '../../utility/app_constant.dart';
import '../../utility/validators.dart';

class ContactScreen extends GetView<ContactController> {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ContactController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact Us"),
      ),
      body: GetBuilder<ContactController>(
        init: controller,
        builder: (controller) => ContactView(controller: controller,),
      ),
    );
  }
}


class ContactView extends StatelessWidget {
  final ContactController? controller;
  final _formKey = GlobalKey<FormState>();
  ContactView({Key? key,this.controller}) : super(key: key);

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
            children: [
              Lottie.asset("assets/lottie/contact-banner.json",height: Get.height * 0.30,width: Get.width * 0.70),
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
              const SizedBox(height: 10.0,),
              TextFormField(
                controller: controller!.emailIDController,
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
              const SizedBox(height: 10.0,),
              TextFormField(
                controller: controller!.contactNumber,
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
              const SizedBox(height: 10.0,),
              TextFormField(
                controller: controller!.descriptionController,
                validator: AppValidators.noBlankValidatior,
                maxLines: 5,
                readOnly: false,

                style: Get.theme.textTheme.bodyMedium!.copyWith(color: Color(0xff1a1c1e)),
                decoration: InputDecoration(
                  hintText: 'Description',
                  labelText: 'Description',
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
              const SizedBox(height: 10.0,),
              const SizedBox(height: 20.0,),
              CupertinoButton(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  color: Colors.black,
                  child: Text(
                    "Submit",
                    style: Get.theme.textTheme.titleSmall!
                        .copyWith(color: Colors.white),
                  ),
                  onPressed: () {

                    if(_formKey.currentState!.validate()){
                      controller!.addAddress();
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}



class ContactSuccessDialog extends StatelessWidget {
  const ContactSuccessDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          width: Get.width,
          decoration: BoxDecoration(
              color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(6.0))
          ),
          margin: EdgeInsets.symmetric(horizontal: 10.0),


          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset("assets/lottie/contact-success.json",height: Get.height * 0.30,width: Get.width * 0.70),
              Text("Your Query Has been Submitted",
                overflow: TextOverflow.ellipsis,
                textScaler: TextScaler.linear(Get.textScaleFactor),
                textAlign: TextAlign.center,
                style: Get.theme.textTheme.titleMedium,
              ),
              const SizedBox(height: 10.0,),
              CupertinoButton(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  color: Colors.black,
                  child: Text(
                    "Dashboard",
                    style: Get.theme.textTheme.titleSmall!
                        .copyWith(color: Colors.white),
                  ),
                  onPressed: () {
                    Get.offAllNamed(Routes.dashboardScreen);
                  })

            ],
          ),
        ),

      ],
    );
  }
}
