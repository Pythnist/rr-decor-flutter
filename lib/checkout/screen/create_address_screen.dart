import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rr_decor_flutter/checkout/controller/create_address_controller.dart';

import '../../utility/app_constant.dart';
import '../../utility/validators.dart';

class CreateAddressScreen extends GetView<CreateAddressController> {
  const CreateAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CreateAddressController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Address"),
      ),
      body: GetBuilder<CreateAddressController>(
        init: controller,
        builder: (controller) => CreateAddressView(controller: controller,),
      ),
    );
  }
}


class CreateAddressView extends StatelessWidget {
  final CreateAddressController? controller;
  final _formKey = GlobalKey<FormState>();
  CreateAddressView({Key? key,this.controller}) : super(key: key);

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
              TextFormField(
                controller: controller!.fullNameController,
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
                controller: controller!.companyNameController,
                validator: AppValidators.noBlankValidatior,
                maxLines: 1,
                readOnly: false,

                style: Get.theme.textTheme.bodyMedium!.copyWith(color: Color(0xff1a1c1e)),
                decoration: InputDecoration(
                  hintText: 'Company Name',
                  labelText: 'Company Name',
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
                controller: controller!.addressController,
                validator: AppValidators.noBlankValidatior,
                maxLines: 5,
                readOnly: false,

                style: Get.theme.textTheme.bodyMedium!.copyWith(color: Color(0xff1a1c1e)),
                decoration: InputDecoration(
                  hintText: 'Address',
                  labelText: 'Address',
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
              const SizedBox(height: 10.0,),
              TextFormField(
                controller: controller!.cityController,
                validator: AppValidators.noBlankValidatior,
                maxLines: 1,
                readOnly: false,

                style: Get.theme.textTheme.bodyMedium!.copyWith(color: Color(0xff1a1c1e)),
                decoration: InputDecoration(
                  hintText: 'City',
                  labelText: 'City',
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
                controller: controller!.stateController,
                validator: AppValidators.noBlankValidatior,
                maxLines: 1,
                readOnly: false,

                style: Get.theme.textTheme.bodyMedium!.copyWith(color: Color(0xff1a1c1e)),
                decoration: InputDecoration(
                  hintText: 'State/Province/Region',
                  labelText: 'State/Province/Region',
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
                controller: controller!.countryController,
                validator: AppValidators.noBlankValidatior,
                maxLines: 1,
                readOnly: false,

                style: Get.theme.textTheme.bodyMedium!.copyWith(color: Color(0xff1a1c1e)),
                decoration: InputDecoration(
                  hintText: 'Country',
                  labelText: 'Country',
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
                controller: controller!.zipCodeController,
                validator: AppValidators.noBlankValidatior,
                maxLines: 1,
                readOnly: false,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                style: Get.theme.textTheme.bodyMedium!.copyWith(color: Color(0xff1a1c1e)),
                decoration: InputDecoration(
                  hintText: 'Zip Code',
                  labelText: 'Zip Code',

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
                controller: controller!.gstController,
                validator: AppValidators.noBlankValidatior,
                maxLines: 1,
                readOnly: false,

                style: Get.theme.textTheme.bodyMedium!.copyWith(color: Color(0xff1a1c1e)),
                decoration: InputDecoration(
                  hintText: 'GST Number',
                  labelText: 'GST Number',
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
                    "Save",
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
