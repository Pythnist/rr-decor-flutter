import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rr_decor_flutter/catalogue/controller/product_detail_controller.dart';
import 'package:rr_decor_flutter/services/startup_service.dart';
import 'package:rr_decor_flutter/utility/app_config.dart';
import 'package:rr_decor_flutter/utility/utility.dart';

import '../../pages/pages.dart';
import '../../utility/app_constant.dart';
import '../../utility/validators.dart';

class ProductDetailScreen extends GetView<ProductDetailController> {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ProductDetailController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Detail"),
        actions: [
          IconButton(onPressed: (){
            Get.toNamed(Routes.checkoutUrl);
          }, icon: Icon(Icons.shopping_cart_outlined)),

        ],
      ),
      body: GetBuilder<ProductDetailController>(
        init: controller,
        builder: (controller) => _buildUI(),
      ),
    );
  }

  Widget _buildUI() {
    if(controller.isLoading){
      return Utility.progressIndicator();
    }else{
      return ProductDetailView(controller: controller,);
    }
  }
}

class ProductDetailView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final ProductDetailController? controller;
   ProductDetailView({Key? key,this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _showItemDescriptionSection(),
            const SizedBox(height: 20.0,),
            _showItemDetailsSection(),
            const SizedBox(height: 20.0,),
            _showDataColumn(),
            const SizedBox(height: 20.0,),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller!.quantityController,
                    validator: AppValidators.noBlankValidatior,
                    keyboardType: TextInputType.text,
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r"[0-9.]")),],
                    style: Get.theme.textTheme.bodyMedium!.copyWith(color: Color(0xff1a1c1e)),
                    decoration: const InputDecoration(
                      hintText: 'Add Quantity',
                      labelText: 'Quantity *',
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
                  SizedBox(

                    width: Get.width,
                    child: CupertinoButton(
                        color: Color(0xff007E48),
                        child: Text(
                          "Add to Cart",
                          style: Get.theme.textTheme.titleMedium!
                              .copyWith(color: Colors.white),
                        ),
                        onPressed: () {
                          if(StartUpService.loginType == AppConfig.userLoginType){
                            if(_formKey.currentState!.validate()){
                              controller!.addToCart();
                            }
                          }else{
                            Get.toNamed(Routes.loginUrl);
                          }
                        }),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  
  
  Widget _showItemDescriptionSection() => Container(
    decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.all(Radius.circular(10.0))
    ),
    child: Column(
      children: [
        Container(
          height: 50,
          width: Get.width,
          decoration: BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0),topRight: Radius.circular(10.0))
          ),
          padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
          child: Center(
            child: Text(
                "Item Description",
              style: Get.theme.textTheme.titleMedium!.copyWith(color: Colors.white),
              overflow: TextOverflow.ellipsis,
              textScaler: TextScaler.linear(Get.textScaleFactor),
              textAlign: TextAlign.center,
              maxLines: 1,
            ),
          ),
        ),
        Container(
          height: 50,
          width: Get.width,
          decoration: BoxDecoration(

              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0),bottomRight: Radius.circular(10.0))
          ),
          padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
          child: Center(
            child: Text(
              controller!.productDetailModel!.result!.itemDetails!.first.itemDescription!,
              style: Get.theme.textTheme.titleMedium!,
              overflow: TextOverflow.ellipsis,
              textScaler: TextScaler.linear(Get.textScaleFactor),
              textAlign: TextAlign.center,
              maxLines: 1,
            ),
          ),
        )
      ],
    ),
  );

  Widget _showItemDetailsSection() => Container(
    decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.all(Radius.circular(10.0))
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(child: Column(

          children: [
            Container(
              height: 55,
              width: Get.width,
              decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0),topRight: Radius.circular(0.0))
              ),
              padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
              child: Center(
                child: Text(
                  "Unit of Measure Code",
                  style: Get.theme.textTheme.bodySmall!.copyWith(color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                  textScaler: TextScaler.linear(Get.textScaleFactor),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
              ),
            ),
            Container(

              width: Get.width,
              decoration: BoxDecoration(

                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0),bottomRight: Radius.circular(10.0))
              ),
              padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
              child: Center(
                child: Text(
                  controller!.productDetailModel!.result!.itemDetails!.first.measureUnit!,
                  style: Get.theme.textTheme.titleSmall!,
                  overflow: TextOverflow.ellipsis,
                  textScaler: TextScaler.linear(Get.textScaleFactor * 1.0),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                ),
              ),
            )
          ],
        )),
        Expanded(child: Column(
          children: [
            Container(
              height: 55,
              width: Get.width,
              decoration: BoxDecoration(
                color: Colors.black87,
                //borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0),topRight: Radius.circular(10.0))
              ),
              padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
              child: Center(
                child: Text(
                  "Projected Available Quantity",
                  style: Get.theme.textTheme.bodySmall!.copyWith(color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                  textScaler: TextScaler.linear(Get.textScaleFactor * 0.9),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
              ),
            ),
            Container(

              width: Get.width,
              decoration: BoxDecoration(

                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0),bottomRight: Radius.circular(10.0))
              ),
              padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
              child: Center(
                child: Text(
                  "${controller!.productDetailModel!.result!.itemDetails!.first.projectedAvailableQty!}",
                  style: Get.theme.textTheme.titleSmall!,
                  overflow: TextOverflow.ellipsis,
                  textScaler: TextScaler.linear(Get.textScaleFactor),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                ),
              ),
            )
          ],
        )),
        Expanded(child: Column(
          children: [
            Container(
              height: 55,
              width: Get.width,
              decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(0.0),topRight: Radius.circular(10.0))
              ),
              padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
              child: Center(
                child: Text(
                  "Projected Available Date",
                  style: Get.theme.textTheme.bodySmall!.copyWith(color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                  textScaler: TextScaler.linear(Get.textScaleFactor * 1.0),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
              ),
            ),
            Container(

              width: Get.width,
              decoration: BoxDecoration(

                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0),bottomRight: Radius.circular(10.0))
              ),
              padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
              child: Center(
                child: Text(
                  "${DateFormat().add_yMd().format(controller!.productDetailModel!.result!.itemDetails!.first.projectedAvailableDate!)}",
                  style: Get.theme.textTheme.titleSmall!,
                  overflow: TextOverflow.ellipsis,
                  textScaler: TextScaler.linear(Get.textScaleFactor),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                ),
              ),
            )
          ],
        ))
      ],
    ),
  );


  Widget _showDataColumn() => Container(
    width: Get.width,
    padding: EdgeInsets.symmetric(horizontal: 0.0),
    decoration: BoxDecoration(
      //color: Colors.black,
        border: Border.all(color: Colors.grey,width: 0.5),
        borderRadius: BorderRadius.all(Radius.circular(10.0))
    ),
    child: Stack(
      children: [
        Container(
          height: 55,
          width: Get.width,
          padding: EdgeInsets.symmetric(horizontal: 0.0),
          decoration: BoxDecoration(

              color: Colors.black,
              borderRadius: BorderRadius.only(topLeft:Radius.circular(10.0),topRight: Radius.circular(10.0))
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: DataTable(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0))
            ),

            headingRowColor:
            WidgetStateColor.resolveWith((states) => Colors.black87),
            headingRowHeight: 50,
            horizontalMargin: 10.0,
            dividerThickness: 0.0,
            showBottomBorder: true,
            columns: [
              DataColumn(
                label: Expanded(
                  child: Text(
                    'Roll No.',
                    style: Get.theme.textTheme.titleSmall!.copyWith(color: Colors.white),
                    overflow: TextOverflow.ellipsis,
                    textScaler: TextScaler.linear(Get.textScaleFactor),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                  ),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: Text(
                    'Available Quantity',
                    style: Get.theme.textTheme.titleSmall!.copyWith(color: Colors.white),
                    overflow: TextOverflow.ellipsis,
                    textScaler: TextScaler.linear(Get.textScaleFactor),
                    textAlign: TextAlign.center,
                    maxLines: 1,

                  ),
                ),
              ),
            ], rows: List.generate(controller!.productDetailModel!.result!.rollNo!.length, (index) => DataRow(cells: <DataCell>[
            DataCell(
              Text(
                "${controller!.productDetailModel!.result!.rollNo!.elementAt(index).lotNo}",
                style: Get.theme.textTheme.titleSmall!,
                overflow: TextOverflow.ellipsis,
                textScaler: TextScaler.linear(Get.textScaleFactor),
                textAlign: TextAlign.center,
                maxLines: 1,
              ),

            ),
            DataCell(
              Text(
                "${controller!.productDetailModel!.result!.rollNo!.elementAt(index).quantity!}",
                style: Get.theme.textTheme.titleSmall!,
                overflow: TextOverflow.ellipsis,
                textScaler: TextScaler.linear(Get.textScaleFactor),
                textAlign: TextAlign.center,
                maxLines: 1,
              ),

            ),

          ])),
          ),
        )
      ],
    ),
  );
  
}
