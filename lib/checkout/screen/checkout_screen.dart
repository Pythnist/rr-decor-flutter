import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rr_decor_flutter/checkout/controller/checkout_controller.dart';
import 'package:rr_decor_flutter/pages/pages.dart';
import 'package:rr_decor_flutter/utility/utility.dart';
import 'package:rr_decor_flutter/model/address_list_model.dart' as AddressModel;

import '../../utility/app_constant.dart';
import '../../utility/validators.dart';

class CheckoutScreen extends GetView<CheckoutController> {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CheckoutController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkout"),
      ),
      body: GetBuilder<CheckoutController>(
        init: controller,
        builder: (controller) => _buildUI(),
      ),
    );
  }

  Widget _buildUI(){
    if(controller.isLoading){
      return Utility.progressIndicator();
    }else{
      return CheckoutView(controller: controller,);
    }
  }
}


class CheckoutView extends StatelessWidget {
  final CheckoutController? controller;
  const CheckoutView({Key? key,this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller!.cartListModel.result!.isNotEmpty ? _showAvailableData()  : _showNoDataAvailable();
  }

  Widget _showAvailableData() => Container(
    height: Get.height,
    width: Get.width,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(child: _showCartList()),
        _showBottomBar()
      ],
    ),
  );

  Widget _showCartList() => ListView.builder(
      itemCount: controller!.cartListModel.result!.length,
      itemBuilder: (context,index) => Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey,width: 0.5),
          borderRadius: BorderRadius.all(Radius.circular(8.0))
        ),
        child: ListTile(
          dense: true,
          title: Text(
            "Item Id: ${controller!.cartListModel.result!.elementAt(index).id}",
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textScaler: TextScaler.linear(Get.textScaleFactor),
            style: Get.theme.textTheme.titleMedium,
          ),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  "Quantity: ${controller!.cartListModel.result!.elementAt(index).quantity}",
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textScaler: TextScaler.linear(Get.textScaleFactor),
                style: Get.theme.textTheme.titleMedium,
              ),
              Text(
                  "${controller!.cartListModel.result!.elementAt(index).productName}",
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textScaler: TextScaler.linear(Get.textScaleFactor),
                style: Get.theme.textTheme.titleMedium,
              ),
            ],
          ),
          trailing: IconButton(
            onPressed: (){
              Utility.showDialog("Delete Confirmation", "Are you sure you want to delete this item? ", (){
                controller!.deleteItem(index);
              });
            },
            icon: Icon(Icons.delete_outline,color: Colors.red,),
          ),
        ),
      ));

  Widget _showNoDataAvailable() => Container(
    height: Get.height,
    width: Get.width,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "No Data Available",
          style: Get.theme.textTheme.titleLarge,
        )
      ],
    ),
  );



  Widget _showBottomBar() => Container(
    margin: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
    padding: EdgeInsets.only(bottom: 20.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // DropdownButtonFormField<AddressModel.Datum>(
        //   value: controller!.selectedAddress,
        //   hint: Text(
        //     'choose one',
        //   ),
        //   isExpanded: true,
        //   isDense: true,
        //   onChanged: (value) {
        //     controller!.selectedAddress = value;
        //     controller!.update();
        //   },
        //
        //   validator: (dynamic value) {
        //     if (value.isEmpty) {
        //       return "can't empty";
        //     } else {
        //       return null;
        //     }
        //   },
        //   items: controller!.addressListModel!.result!.data!
        //       .map((AddressModel.Datum val) {
        //     return DropdownMenuItem(
        //       value: val,
        //       child: Text(
        //         val.fullAddress!,
        //       ),
        //     );
        //   }).toList(),
        // )
        TextFormField(
          controller: controller!.selectedAddressController,
          validator: AppValidators.noBlankValidatior,
          maxLines: 1,
          readOnly: true,
          onTap: (){
            Get.bottomSheet(ShowAddressSheet(controller: controller,));
          },
          style: Get.theme.textTheme.bodyMedium!.copyWith(color: Color(0xff1a1c1e)),
          decoration: InputDecoration(
            hintText: 'Select Address',
            labelText: 'Address *',
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
            suffixIcon: Icon(
              Icons.arrow_circle_down,
              color: Color(0xff79747E),
            ),
          ),
        ),
        const SizedBox(height: 2.0,),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: (){
                Get.toNamed(Routes.addAddress)!.then((value) => controller!.getCartRefresh());
              },
              child: Text("Add Address",style: Get.theme.textTheme.titleSmall!.copyWith(color: Colors.blue,fontWeight: FontWeight.bold),),
            )
          ],
        ),
        const SizedBox(height: 2.0,),
        const SizedBox(height: 10.0,),
        TextFormField(
          controller: controller!.transportModeController,
          validator: AppValidators.noBlankValidatior,
          maxLines: 1,
          readOnly: true,
          onTap: (){
            Get.bottomSheet(SelctTransportModeSheet(controller: controller,));
          },
          style: Get.theme.textTheme.bodyMedium!.copyWith(color: Color(0xff1a1c1e)),
          decoration: InputDecoration(
            hintText: 'Select Transport Mode',
            labelText: 'Transport Mode *',
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
            suffixIcon: Icon(
              Icons.arrow_circle_down,
              color: Color(0xff79747E),
            ),
          ),
        ),
        const SizedBox(height: 10.0,),
        Row(
          children: [
            Expanded(child: TextFormField(
              controller: controller!.salesManController,
              validator: AppValidators.noBlankValidatior,
              maxLines: 1,
              readOnly: false,

              style: Get.theme.textTheme.bodyMedium!.copyWith(color: Color(0xff1a1c1e)),
              decoration: InputDecoration(
                hintText: 'Name of Sales Man',
                labelText: 'Name of Sales Man',
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
            ),),
            const SizedBox(width: 5.0,),
            Expanded(child: TextFormField(
              controller: controller!.orderReferenceController,
              validator: AppValidators.noBlankValidatior,
              maxLines: 1,
              readOnly: false,

              style: Get.theme.textTheme.bodyMedium!.copyWith(color: Color(0xff1a1c1e)),
              decoration: InputDecoration(
                hintText: 'Order Reference',

                labelText: 'Order Reference',
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
            ),)
          ],
        ),
        const SizedBox(height: 10.0,),
        Container(
          height: 50,
          width: Get.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
              border: Border.all(color: Colors.black,width: 0.5)
          ),
          child: CupertinoButton(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
              color: Colors.black,
              child: Text(
                "Checkout",
                style: Get.theme.textTheme.titleSmall!
                    .copyWith(color: Colors.white),
              ),
              onPressed: () {
                controller!.makeCheckout();
              }),
        ),
      ],
    ),
  );

}



class ShowAddressSheet extends StatelessWidget {
  final CheckoutController? controller;
  const ShowAddressSheet({Key? key,this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          AppBar(
            title: Text("Select Address"),
          ),
          Expanded(child: _showAddressList())
        ],
      ),
    );
  }

  Widget _showAddressList() => ListView.builder(
      itemCount: controller!.addressListModel!.result!.data!.length,
      itemBuilder: (context,index) => Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
        decoration: BoxDecoration(
          color: index.isEven ? Colors.white60 : Colors.white70,
          border: Border.all(color: Colors.grey,width: 0.5),
          borderRadius: BorderRadius.all(Radius.circular(5.0))
        ),
        child: ListTile(
          onTap: (){
            controller!.selectedAddressController!.text = "${controller!.addressListModel!.result!.data!.elementAt(index).fullAddress},${controller!.addressListModel!.result!.data!.elementAt(index).district!}, ${controller!.addressListModel!.result!.data!.elementAt(index).state!}, ${controller!.addressListModel!.result!.data!.elementAt(index).pinCode!}";
            controller!.selectedAddress = controller!.addressListModel!.result!.data!.elementAt(index);
            Get.back();
          },
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                controller!.addressListModel!.result!.data!.elementAt(index).fullAddress!,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textScaler: TextScaler.linear(Get.textScaleFactor),
                style: Get.theme.textTheme.titleMedium,
              ),
              Text(
                "${controller!.addressListModel!.result!.data!.elementAt(index).district!}, ${controller!.addressListModel!.result!.data!.elementAt(index).state!}, ${controller!.addressListModel!.result!.data!.elementAt(index).pinCode!}",
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textScaler: TextScaler.linear(Get.textScaleFactor),
                style: Get.theme.textTheme.titleSmall,
              ),
              Text(
                "GST No: ${controller!.addressListModel!.result!.data!.elementAt(index).gstId ?? "N/A"}",
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textScaler: TextScaler.linear(Get.textScaleFactor),
                style: Get.theme.textTheme.titleSmall,
              ),
              const SizedBox(height: 5.0,),
              Text(
                controller!.addressListModel!.result!.data!.elementAt(index).companyName!,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textScaler: TextScaler.linear(Get.textScaleFactor),
                style: Get.theme.textTheme.titleSmall,

              )
            ],
          ),
        ),
      ));
}

class SelctTransportModeSheet extends StatelessWidget {
  final CheckoutController? controller;
  const SelctTransportModeSheet({Key? key,this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          AppBar(
            title: Text("Select Transport Mode"),
          ),
          Expanded(child: _showTransportList())
        ],
      ),
    );
  }

  Widget _showTransportList() => ListView.builder(
      itemCount: controller!.addressListModel!.result!.modeOfTransport!.length,
      itemBuilder: (context,index) => ListTile(
        onTap: (){
          controller!.transportModeController!.text = controller!.addressListModel!.result!.modeOfTransport!.elementAt(index);

          Get.back();
        },
        title: Text(
          controller!.addressListModel!.result!.modeOfTransport!.elementAt(index),
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          textScaler: TextScaler.linear(Get.textScaleFactor),
          style: Get.theme.textTheme.titleMedium,
        ),

      ));
}
