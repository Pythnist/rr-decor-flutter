import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:rr_decor_flutter/checkout/controller/checkout_success_controller.dart';
import 'package:rr_decor_flutter/pages/pages.dart';


class CheckoutSuccessScreen extends GetView<CheckoutSuccessController> {
  const CheckoutSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CheckoutSuccessController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Order Success"),
      ),
      body: GetBuilder<CheckoutSuccessController>(
        init: controller,
        builder: (controller) => OrderSuccessView(),
      ),
    );
  }
}


class OrderSuccessView extends StatelessWidget {
  const OrderSuccessView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset("assets/lottie/success.json",
            height: Get.height * 0.30,
            width: Get.width * 0.60,
            repeat: false
          ),
          Text("Success!",
            overflow: TextOverflow.ellipsis,

            textScaler: TextScaler.linear(Get.textScaleFactor),
            style: Get.theme.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10.0,),
          Text("Your Order Will be Delivered Soon",
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textScaler: TextScaler.linear(Get.textScaleFactor),
            style: Get.theme.textTheme.titleMedium!,
          ),
          Text("Thank you for choosing our app!",
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textScaler: TextScaler.linear(Get.textScaleFactor),
            style: Get.theme.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
          ),
          // const SizedBox(height: 20.0,),
          // Container(
          //   height: 50,
          //
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.all(Radius.circular(25.0)),
          //     border: Border.all(color: Colors.black,width: 0.5)
          //   ),
          //   child: CupertinoButton(
          //       borderRadius: BorderRadius.all(Radius.circular(25.0)),
          //       color: Colors.white,
          //       child: Text(
          //         "Track Order",
          //         style: Get.theme.textTheme.titleSmall!
          //             .copyWith(color: Colors.black),
          //       ),
          //       onPressed: () {
          //
          //       }),
          // ),
          const SizedBox(height: 10.0,),
          Container(
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
                border: Border.all(color: Colors.black,width: 0.5)
            ),
            child: CupertinoButton(
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
                color: Colors.black,
                child: Text(
                  "Continue Shopping",

                  style: Get.theme.textTheme.titleSmall!
                      .copyWith(color: Colors.white),
                ),
                onPressed: () {
                  Get.offAllNamed(Routes.dashboardScreen);
                }),
          ),
        ],
      ),
    );
  }
}
