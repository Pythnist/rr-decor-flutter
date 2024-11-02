import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:rr_decor_flutter/model/product_model.dart';
import 'package:rr_decor_flutter/network/api_path.dart';
import 'package:rr_decor_flutter/pages/pages.dart';
import 'package:rr_decor_flutter/utility/utility.dart';

import '../controller/product_controller.dart';

class ProductScreen extends GetView<ProductController> {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ProductController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
      ),
      body: GetBuilder<ProductController>(
        init: controller,
        builder: (controller) => _buildUI(),
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
  final ProductController? controller;
  const ProductView({Key? key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      child: controller!.productModel!.result!.isNotEmpty
          ? _productListCard()
          : _showNoDataAvailable(),
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

  Widget _productListCard() => Container(
        padding: const EdgeInsets.all(10.0),
        child: MasonryGridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: controller!.productModel!.result!.length,
          itemBuilder: (context, index) {
            return _showCollectionCard(
                controller!.productModel!.result!.elementAt(index),index);
          },
        ),
      );

  Widget _showCollectionCard(Result model,int index) => GestureDetector(
        onTap: () {
          Get.bottomSheet(ProductDetailSheet(controller: controller,index: index,));
        },
        child: Container(
          height: 190,
          child: Card(
            elevation: 1.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(6.0))),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CachedNetworkImage(
                    height: 100,
                    imageUrl: "${ApiPath.mediaRenderUrl}${model.image}",
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    placeholder: (context, url) => Utility.progressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    model.productName!.capitalizeFirst!,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    textScaler: TextScaler.linear(Get.textScaleFactor),
                    style: Get.theme.textTheme.titleMedium!
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}

class ProductDetailSheet extends StatelessWidget {
  final ProductController? controller;
  final int? index;
  const ProductDetailSheet({Key? key, this.controller,this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          AppBar(
            title: Text("Product Details"),
          ),
          Expanded(child: _showList())
        ],
      ),
    );
  }


  Widget _showList() => ListView.builder(
      itemCount: controller!.productModel!.result!.elementAt(index!).productDetails!.length,
      itemBuilder: (context,indexss) => ListTile(
        onTap: (){
          Get.toNamed(Routes.productDetailUrl,arguments: [controller!.productModel!.result!.elementAt(index!).productDetails!.elementAt(indexss).id]);
        },
      title:Text(controller!.productModel!.result!.elementAt(index!).productDetails!.elementAt(indexss).itemDescription!.capitalize!,
      style: Get.theme.textTheme.titleMedium!,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.start,
      textScaler: TextScaler.linear(Get.textScaleFactor),
    ),
        trailing: IconButton(onPressed: (){
          Get.toNamed(Routes.productDetailUrl,arguments: [controller!.productModel!.result!.elementAt(index!).productDetails!.elementAt(indexss).id]);
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
