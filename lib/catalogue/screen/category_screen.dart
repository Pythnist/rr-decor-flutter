import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rr_decor_flutter/catalogue/controller/category_controller.dart';
import 'package:rr_decor_flutter/model/category_model.dart';
import 'package:rr_decor_flutter/network/api_path.dart';
import 'package:rr_decor_flutter/pages/pages.dart';
import 'package:rr_decor_flutter/utility/utility.dart';

class CategoryScreen extends GetView<CategoryController> {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CategoryController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Categories"),
      ),
      body: GetBuilder<CategoryController>(
        init: controller,
        builder: (controller) => _buildUI(),
      ),
    );
  }


  Widget _buildUI() {
    if(controller.isLoading){
      return Utility.progressIndicator();
    }else{
      return CategoryView(controller: controller,);
    }
  }

}

class CategoryView extends StatelessWidget {
  final CategoryController? controller;
  const CategoryView({Key? key,this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      child: controller!.categoryModel!.result!.isNotEmpty ? _showListView() : _showNoDataAvailable(),
    );
  }
  
  
  
  Widget _showNoDataAvailable() => Container(
    height: Get.height,
    width: Get.width,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("No Categories Available",style: Get.theme.textTheme.titleLarge,)
      ],
    ),
  );


  Widget _showListView() => ListView.builder(
      itemCount: controller!.categoryModel!.result!.length,
      itemBuilder: (context,index) => _showCard(controller!.categoryModel!.result!.elementAt(index)),);



  Widget _showCard(Result model) => GestureDetector(
    onTap: (){
      Get.log("Get Json ::: ${model.toJson().toString()}");
      if(["",null,"null"].contains(model.subCategoryName) == false){
        Get.toNamed(Routes.subCategoryUrl,arguments: [model.id]);
      }else{
        Get.toNamed(Routes.productUrl,arguments: [model.id]);
      }
    },
    child: Container(
      width: Get.width,
      child: Card(
        elevation: 1.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0))
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
          width: Get.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: Container(
                //width: Get.width,
                //color: Colors.grey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Utility.imageContainer("${ApiPath.mediaRenderUrl}${model.categoryImage}", 100, 100),
                    Flexible(child: Text(model.categoryName!.capitalize!,style: Get.theme.textTheme.titleMedium,
                      textAlign: TextAlign.start,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textScaler: TextScaler.linear(Get.textScaleFactor),
                    ))
                  ],
                ),
              )),
              IconButton(onPressed: (){
                if(["",null,"null"].contains(model.subCategoryName) == false){
                  Get.toNamed(Routes.subCategoryUrl,arguments: [model.id]);
                }else{
                  Get.toNamed(Routes.productUrl,arguments: [model.id]);
                }
              }, icon: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.10),
                    shape: BoxShape.circle
                ),
                child: Center(
                  child: Icon(Icons.arrow_forward,color: Colors.black54,),
                ),
              ))
            ],
          ),
        ),
      ),
    ),
  );
}
