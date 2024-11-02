import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:rr_decor_flutter/catalogue/controller/search_controller.dart';
import 'package:rr_decor_flutter/model/product_model.dart';
import 'package:rr_decor_flutter/network/api_path.dart';
import 'package:rr_decor_flutter/pages/pages.dart';
import 'package:rr_decor_flutter/utility/utility.dart';

import '../../utility/app_constant.dart';
import '../../utility/validators.dart';
import '../controller/product_controller.dart';

class ProductSearchScreen extends GetView<ProductSearchController> {
  const ProductSearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ProductSearchController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Stock"),
      ),
      body: GetBuilder<ProductSearchController>(
        init: controller,
        builder: (controller) => ProductView(controller: controller,),
      ),
    );
  }

  Widget _buildUI() {
    if (controller.isLoading) {
      return Utility.progressIndicator();
    } else {
      return ProductView(
        controller: controller,
      );
    }
  }
}

class ProductView extends StatelessWidget {
  final ProductSearchController? controller;
  const ProductView({Key? key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      height: Get.height,
      width: Get.width,
      child: Column(
        children: [
          const SizedBox(height: 10.0,),
          TextFormField(
            controller: controller!.searchController,
            validator: AppValidators.noBlankValidatior,
            maxLines: 1,
            readOnly: false,
            onChanged: (String value){
              if(value.toString().length > 3){
                controller!.fetchData();
              }else{
                controller!.productModel.clear();
                controller!.update();
              }
            },
            style: Get.theme.textTheme.bodyMedium!.copyWith(color: Color(0xff1a1c1e)),
            decoration: InputDecoration(
              hintText: 'Search Stock',

              labelText: 'Search Stock',
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
          Obx(() => Expanded(child: Visibility(
            visible: controller!.isLoading == false,
            child: controller!.productModel!.isNotEmpty
                ? _showList()
                : _showNoDataAvailable(),)))
        ],
      ),
    );
  }

  Widget _showNoDataAvailable() => Container(
    height: Get.height,
    width: Get.width,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "No Products Available",
          style: Get.theme.textTheme.titleLarge,
        )
      ],
    ),
  );


  Widget _showList() => ListView.separated(
      itemCount: controller!.productModel!.length,
      separatorBuilder: (context,index) => Divider(),
      itemBuilder: (context,index) => ListTile(
        onTap: (){
          Get.toNamed(Routes.productDetailUrl,arguments: [controller!.productModel!.elementAt(index).id]);
        },
        title:Text(controller!.productModel!.elementAt(index).itemDescription,
          style: Get.theme.textTheme.titleMedium!,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.start,
          textScaler: TextScaler.linear(Get.textScaleFactor),
        ),
        subtitle: Text("Projected Available Quantity: ${controller!.productModel!.elementAt(index).projectedAvailableQty!.toStringAsFixed(2)}",
          style: Get.theme.textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w700),
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.start,
          maxLines: 2,
          textScaler: TextScaler.linear(Get.textScaleFactor),
        ),
        trailing: IconButton(onPressed: (){
          Get.toNamed(Routes.productDetailUrl,arguments: [controller!.productModel!.elementAt(index).id]);
        }, icon: Container(
          height: 40,
          width: 40,
          padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.10),
              shape: BoxShape.circle
          ),
          child: Center(
            child: Icon(Icons.arrow_forward,color: Colors.black54,size: 15,),
          ),
        )),
      ));
}

