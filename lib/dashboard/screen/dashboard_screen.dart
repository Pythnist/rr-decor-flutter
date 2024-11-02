import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:rr_decor_flutter/dashboard/controller/dashboard_controller.dart';
import 'package:rr_decor_flutter/model/banner_model.dart';
import 'package:rr_decor_flutter/model/banner_model.dart' as BannerM;
import 'package:rr_decor_flutter/model/common_model.dart';
import 'package:rr_decor_flutter/network/api_path.dart';
import 'package:rr_decor_flutter/pages/pages.dart';
import 'package:rr_decor_flutter/services/startup_service.dart';
import 'package:rr_decor_flutter/model/collection_model.dart' as CollectionR;
import '../../utility/app_config.dart';
import '../../utility/static_database.dart';
import '../../utility/styles.dart';
import '../../utility/utility.dart';

class DashboardScreen extends GetView<DashboardController> {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(DashboardController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          StartUpService.isLogin! ? IconButton(onPressed: (){
            Get.toNamed(Routes.checkoutUrl);
          }, icon: Icon(Icons.shopping_cart_outlined)) : IconButton(onPressed: (){
            Get.offAllNamed(Routes.loginUrl);
          }, icon: Icon(Icons.person)),
          //IconButton(onPressed: (){}, icon: Icon(Icons.person))
        ],
      ),
      drawer: DDrawer(controller: controller,),
      body: GetBuilder<DashboardController>(
        init: controller,
        builder: (controller) => _buildUI(),
      ),
    );
  }



  Widget _buildUI() {
    if(controller.isLoading){
      return Utility.progressIndicator();
    }else{
      return DashboardView(controller: controller,);
    }
  }





}

class DashboardView extends StatelessWidget {
  final DashboardController? controller;
  const DashboardView({Key? key,this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _showSearchCard(),
            _showSlider(),
            _showClientList(),
            Divider(),
            Text(
              "Collections",
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              textScaler: TextScaler.linear(Get.textScaleFactor),
              style: Get.theme.textTheme.headlineSmall,
            ),
            _categoryListCard()
          ],
        ),
      ),
    );
  }

  Widget _showSlider() => CarouselSlider.builder(
    itemCount: controller!.bannerModel!.result.length,
    itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
    _sliderCard(controller!.bannerModel!.result.elementAt(itemIndex)), options: CarouselOptions(
    autoPlay: true
  ),
  );

  Widget _sliderCard(Result model) => Container(
    padding: EdgeInsets.symmetric(horizontal: 5.0,vertical: 10.0),

    child: CachedNetworkImage(
      height: 150,
      width: Get.width * 0.90,
      imageUrl: "${ApiPath.mediaRenderUrl}${model.bannerImage}",
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
  );


  Widget _showClientList() => Container(
    // decoration: BoxDecoration(
    //   color: Colors.white,
    //   boxShadow: [
    //     BoxShadow(
    //       color: Colors.grey.withOpacity(0.15),
    //       offset: Offset(0, 3),
    //       blurRadius: 6.0,
    //     ),
    //   ],
    //   borderRadius: BorderRadius.circular(10),
    // ),
    padding: const EdgeInsets.all(10.0),
    child: MasonryGridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount:
      StaticDatabase.imageLis.length,
      itemBuilder: (context, index) {
        return _showImageList(StaticDatabase.imageLis
            .elementAt(index));
      },
    ),
  );


  Widget _showImageList(CommonModel model) => Container(
    margin: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
    height: 50,
    width: 50,
    decoration: BoxDecoration(
      image: DecorationImage(image: AssetImage(model.icon),fit: BoxFit.contain)
    )
  );

  Widget _categoryListCard() => Container(
    // decoration: BoxDecoration(
    //   color: Colors.white,
    //   boxShadow: [
    //     BoxShadow(
    //       color: Colors.grey.withOpacity(0.15),
    //       offset: Offset(0, 3),
    //       blurRadius: 6.0,
    //     ),
    //   ],
    //   borderRadius: BorderRadius.circular(10),
    // ),
    padding: const EdgeInsets.all(10.0),
    child: MasonryGridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount:
      controller!.bannerModel!.result.length,
      itemBuilder: (context, index) {
        return _showCollectionCard(controller!.collectionModel!.result
            .elementAt(index));
      },
    ),
  );


  Widget _showCollectionCard(CollectionR.Result model) => GestureDetector(
    onTap: (){
      Get.toNamed(Routes.categoryUrl,arguments: [model.id]);
    },
    child: Container(
      height: 190,
      child: Card(
        elevation: 1.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(6.0))
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5.0,vertical: 5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CachedNetworkImage(
                height: 100,
                imageUrl: "${ApiPath.mediaRenderUrl}${model.categoryImage}",
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
              const SizedBox(height: 10.0,),
              Flexible(child: Text(
                model.homepageName.toUpperCase()!,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                maxLines: 2,
                textScaler: TextScaler.linear(Get.textScaleFactor),
                style: Get.theme.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500),
              )),
            ],
          ),
        ),
      ),
    ),
  );



  Widget _showSearchCard() => GestureDetector(
    onTap: (){
      Get.toNamed(Routes.productSearchScreen);
    },
    behavior: HitTestBehavior.opaque,
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.0))
      ),
      margin: EdgeInsets.symmetric(horizontal: 5.0,vertical: 5.0),
      child: Card(
        shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.grey,width: 0.2),
            borderRadius: BorderRadius.all(Radius.circular(8.0))
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Search Stock",
                style: Get.theme.textTheme.titleMedium,
                overflow: TextOverflow.ellipsis,
                textScaler: TextScaler.linear(Get.textScaleFactor),
                textAlign: TextAlign.center,
              ),
              Icon(Icons.search)
            ],
          ),
        ),
      ),
    ),
  );

}

class DDrawer extends StatelessWidget {
  final DashboardController? controller;

  const DDrawer({Key? key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: Get.width * 0.70,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              ((StartUpService.loginType != null && StartUpService.loginType == AppConfig.guestLoginType)) ? Container(
                height: 50,
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                width: Get.width,
                child: CupertinoButton(
                    color: Colors.black,
                    child: Text("Login",
                      textAlign: TextAlign.center,
                      style: Get.theme.textTheme.titleMedium!.copyWith(color: Colors.white),
                      overflow: TextOverflow.ellipsis,
                    ), onPressed: (){
                      Get.back();
                      Get.toNamed(Routes.loginUrl);
                }),
              ) : DrawerHeader(child:Container(

                padding: EdgeInsets.only(left: 10.0,right: 10.0,bottom: 20.0,top: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.00),
                      decoration: BoxDecoration(
                        color: Get.theme.primaryColorLight,
                        border: Border.all(color: Get.theme.primaryColor),
                        shape: BoxShape.circle,
                        // image: DecorationImage(
                        //     image: NetworkImage(AppConstant.dummyImage),
                        //     fit: BoxFit.fill
                        // ),
                      ),
                      child: Center(
                        child: Text(StartUpService.name![0].toUpperCase(),style: Get.theme.textTheme.headlineLarge!.copyWith(fontSize: 30,color: Colors.white),),
                      ),
                    ),

                    Text(
                      StartUpService.name ?? "",
                      textScaler: TextScaler.linear(Get.textScaleFactor),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: Get.theme.textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.w700),
                    ),

                    Text(
                      StartUpService.email ?? "",
                      textScaler: TextScaler.linear(Get.textScaleFactor),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: Get.theme.textTheme.titleSmall!.copyWith(
                      ),
                    )
                  ],
                ),
              )) ,

              // Divider(
              //   thickness: 1.5,
              // ),
              Expanded(child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Flexible(
                        child: ListView.builder(
                            itemCount: StaticDatabase.drawerList.length,
                            itemBuilder: (context, index) => Visibility(
                                visible: true,
                                child: ListTile(

                                  onTap: () {
                                    if (StaticDatabase.drawerList
                                        .elementAt(index)
                                        .routes !=
                                        null) {
                                      Get.back();
                                      Get.toNamed(StaticDatabase.drawerList
                                          .elementAt(index)
                                          .routes!);
                                    }
                                  },
                                  // leading: Icon(StaticDatabase.drawerList
                                  //     .elementAt(index)
                                  //     .iconData,color: Get.theme.primaryColor,size: 20,),
                                  title: Text(
                                    StaticDatabase.drawerList.elementAt(index).label!,
                                    textScaler: TextScaler.linear(Get.textScaleFactor),
                                    overflow: TextOverflow.ellipsis,
                                    style: Get.theme.textTheme.titleSmall!
                                        .copyWith(fontWeight: FontWeight.w600),
                                  ),
                                )))),
                    Visibility(
                        visible: ((StartUpService.loginType != null && StartUpService.loginType == AppConfig.guestLoginType)) == false,
                        child: GestureDetector(
                      onTap: () {
                        Get.back();
                        1.delay().then((value) => Utility.showLogoutDialog());
                      },
                      behavior: HitTestBehavior.opaque,
                      child: Container(
                        height: 50,
                        margin: EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.all(Radius.circular(12.0))),
                        child: Center(
                          child: Text(
                            "Logout",
                            textScaler: TextScaler.linear(Get.textScaleFactor),
                            overflow: TextOverflow.ellipsis,

                          ),
                        ),
                      ),
                    )),
                    const SizedBox(
                      height: 0.0,
                    ),
                  ],
                ),))
            ],
          ),
        ));

  }


}