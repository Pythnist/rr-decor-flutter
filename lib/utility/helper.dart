

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_constant.dart';




class NoDataAvailable extends StatelessWidget {
  final String? message;
  const NoDataAvailable({Key? key,this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height/2,
      width: Get.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

        ],
      ),
    );
  }
}


class TripSuccessDialog extends StatelessWidget {
  final void Function()? onClick;
  final String? title;
  const TripSuccessDialog({Key? key,this.onClick,this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Wrap(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.0),
               width: Get.width * 0.80,
              decoration: BoxDecoration(
                  color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10.0))
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Hooray",style: Get.theme.textTheme.titleLarge!.copyWith(color: Colors.black,fontWeight: FontWeight.bold),),
                  const SizedBox(height: 10.0,),
                  Text("Trip Created Successfully",style: Get.theme.textTheme.titleLarge!.copyWith(color: Colors.black,fontWeight: FontWeight.w600),),
                  const SizedBox(height: 10.0,),
                  TextButton(

                    onPressed: onClick,
                    child: Text("My Trips",style: Get.theme.textTheme.titleLarge!.copyWith(color: Colors.pink,fontWeight: FontWeight.w600),),
                  )

                ],
              ),
            )
          ],
        )
      ],
    );
  }
}


class ChooseImageOptionPicker extends StatelessWidget {
  final void Function()? onClickGallery;
  final void Function()? onClickCamera;
  const ChooseImageOptionPicker({Key? key,this.onClickCamera,this.onClickGallery}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topRight: Radius.circular(15.0),topLeft: Radius.circular(15.0))
          ),
          child: Column(
            children: [
              const SizedBox(height: 10.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Choose From",style: Get.theme.textTheme.titleLarge,),

                  InkWell(
                    onTap: (){
                      Get.back();
                    },
                    child: Icon(Icons.close),
                  )
                ],
              ),
              const SizedBox(height: 20.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    // onTap: (){
                    //   Get.back();
                    //   controller!.pickAndCropImage(ImageSource.gallery);
                    // },
                    onTap: onClickGallery,
                    behavior: HitTestBehavior.opaque,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
                      decoration: BoxDecoration(
                          color: Get.theme.primaryColor,
                          borderRadius: BorderRadius.all(Radius.circular(10.0))
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        children: [
                          // Image.asset("assets/images/gallery.png",height: 80,width: 80,),
                          Icon(Icons.image,color: Colors.white,),
                          const SizedBox(height: 5.0,),
                          Text("Gallery",style: Get.theme.textTheme.titleMedium!.copyWith(color: Colors.white),)
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 20.0,),
                  GestureDetector(
                    // onTap: (){
                    //   Get.back();
                    //   controller!.pickAndCropImage(ImageSource.camera);
                    // },
                    onTap: onClickCamera,
                    behavior: HitTestBehavior.opaque,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
                      decoration: BoxDecoration(
                          color: Colors.blue,

                          borderRadius: BorderRadius.all(Radius.circular(10.0))
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        children: [
                          //Image.asset("assets/images/camera.png",height: 80,width: 80,),
                          Icon(Icons.image,color: Colors.white,),
                          const SizedBox(height: 5.0,),
                          Text("Camera",style: Get.theme.textTheme.titleMedium!.copyWith(color: Colors.white),)
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20.0,),
              Padding(padding: EdgeInsets.symmetric(horizontal: 10.0),child: Divider(thickness: 0.5,),),
              const SizedBox(height: 20.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/images/tips.png",height: 20,width: 20,),
                  const SizedBox(width: 10.0,),
                  Text("Here are few tips",style: Get.theme.textTheme.titleMedium,),
                ],
              ),
              const SizedBox(height: 10.0,),
              Text("Avoid the following photos to highlight Picture Better".tr,style: Get.theme.textTheme.titleSmall,),
              const SizedBox(height: 20.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/front-blur.png",height: 50,width: 50,),
                      const SizedBox(height: 5.0,),
                      Text("blur".tr,style: Get.theme.textTheme.titleSmall,)
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/side-blur.png",height: 50,width: 50,),
                      const SizedBox(height: 5.0,),
                      Text("blur".tr,style: Get.theme.textTheme.titleSmall,)
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/watermark-blur.png",height: 50,width: 50,),
                      const SizedBox(height: 5.0,),
                      Text("blur".tr,style: Get.theme.textTheme.titleSmall,)
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/group-blur.png",height: 50,width: 50,),
                      const SizedBox(height: 5.0,),
                      Text("blur".tr,style: Get.theme.textTheme.titleSmall,)
                    ],
                  )
                ],
              ),
              const SizedBox(height: 10.0,),

            ],
          ),
        )
      ],
    );
  }
}


// class SearchPlaces extends StatelessWidget {
//   final GetxController? controller;
//   final void Function(PlacesModel model)? onClick;
//   const SearchPlaces({Key? key,this.controller,this.onClick}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.white,
//       child: Column(
//         children: [
//           AppBar(
//             title: Text("Search Places"),
//           ),
//           Padding(padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),child: BikeTextField(
//             textEditingController: controller!.searchController,
//             isMandatory: true,
//             readOnly: false,
//             showTrailingIcon: false,
//             hintText: "Enter Search Terms",
//             label: "Search places",
//             suffixIcon: Icon(Icons.center_focus_strong_rounded),
//             validate: AppValidators.noBlankValidatior,
//             onChanged: (String? value){
//               if(value!.length > 2){
//                 controller!.searchFilter();
//                 Get.log("Ol");
//               }else{
//                 controller!.filterModel.clear();
//                 controller!.update();
//               }
//               Get.log("Ol");
//               //controller!.userProfileModel!.fullName = value;
//             },
//             textInputType: TextInputType.name,
//             maxLines: 1,
//             showLabel: true,
//             obscureText: false,
//           ),),
//           const SizedBox(height: 0.0,),
//           GetBuilder<CreateTripController>(
//               init: controller,
//               builder: (controller) => Expanded(child: controller.filterModel.isNotEmpty ? _showPlaces() : NoDataAvailable(message: "Type in Search to Show places",)))
//         ],
//       ),
//     );
//   }
//
//
//   Widget _showPlaces() => ListView.builder(
//     itemCount: controller!.filterModel.length,
//     padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 0.0),
//     itemBuilder: (context,index) => Padding(padding: EdgeInsets.only(bottom: 5.0),child: ColoredBox(color: Get.theme.primaryColor,child: ListTile(
//       dense: true,
//       onTap: () =>  onClick!(controller!.filterModel.elementAt(index)),
//       title: Text(controller!.filterModel.elementAt(index).city!,style: Get.theme.textTheme.titleMedium,),
//       subtitle: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(controller!.filterModel.elementAt(index).country!,style: Get.theme.textTheme.titleMedium,),
//         ],
//       ),
//       trailing: Text(controller!.filterModel.elementAt(index).iso2!,style: Get.theme.textTheme.titleMedium,),
//     ),),),);
//
// }