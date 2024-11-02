import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rr_decor_flutter/checkout/controller/order_hitory_controller.dart';
import 'package:rr_decor_flutter/model/order_history_model.dart';
import 'package:rr_decor_flutter/utility/app_constant.dart';

class OrderHistoryScreen extends GetView<OrderHitoryController> {
  const OrderHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OrderHitoryController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Order History"),
      ),
      body: GetBuilder<OrderHitoryController>(
        init: controller,
        builder: (controller) => OrderHistoryView(
          controller: controller,
        ),
      ),
    );
  }
}

class OrderHistoryView extends StatelessWidget {
  final OrderHitoryController? controller;
  const OrderHistoryView({Key? key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller!.orderHistoryModel!.result!.isNotEmpty
        ? _showListView()
        : _showNoDataAvailable();
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

  Widget _showAvailableData() => Container(
        width: Get.width,
        padding: EdgeInsets.symmetric(horizontal: 0.0),
        // decoration: BoxDecoration(
        //   //color: Colors.black,
        //     border: Border.all(color: Colors.grey,width: 0.5),
        //     borderRadius: BorderRadius.all(Radius.circular(10.0))
        // ),
        child: Stack(
          children: [
            Container(
              height: 55,
              width: Get.width,
              padding: EdgeInsets.symmetric(horizontal: 0.0),
              // decoration: BoxDecoration(
              //
              //     color: Colors.black,
              //     borderRadius: BorderRadius.only(topLeft:Radius.circular(10.0),topRight: Radius.circular(10.0))
              // ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 0.0),
              child: DataTable(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
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
                        'Date',
                        style: Get.theme.textTheme.bodySmall!
                            .copyWith(color: Colors.white),
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
                        'Order Status',
                        style: Get.theme.textTheme.bodySmall!
                            .copyWith(color: Colors.white),
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
                        'Quantity',
                        style: Get.theme.textTheme.bodySmall!
                            .copyWith(color: Colors.white),
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
                        'Product Name',
                        style: Get.theme.textTheme.bodySmall!
                            .copyWith(color: Colors.white),
                        overflow: TextOverflow.ellipsis,
                        textScaler: TextScaler.linear(Get.textScaleFactor),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                      ),
                    ),
                  ),
                ],
                rows: List.generate(
                    controller!.orderHistoryModel!.result!.length,
                    (index) => DataRow(cells: <DataCell>[
                          DataCell(
                            Text(
                              "${AppConstant.getDateFormat.format(controller!.orderHistoryModel!.result!.elementAt(index).createdAt!)}",
                              style: Get.theme.textTheme.titleSmall!,
                              overflow: TextOverflow.ellipsis,
                              textScaler:
                                  TextScaler.linear(Get.textScaleFactor),
                              textAlign: TextAlign.center,
                              maxLines: 1,
                            ),
                          ),
                          DataCell(
                            Text(
                              "${controller!.orderHistoryModel!.result!.elementAt(index).orderStatus}",
                              style: Get.theme.textTheme.titleSmall!,
                              overflow: TextOverflow.ellipsis,
                              textScaler:
                                  TextScaler.linear(Get.textScaleFactor),
                              textAlign: TextAlign.center,
                              maxLines: 1,
                            ),
                          ),
                          DataCell(
                            Text(
                              "${controller!.orderHistoryModel!.result!.elementAt(index).quantity}",
                              style: Get.theme.textTheme.titleSmall!,
                              overflow: TextOverflow.ellipsis,
                              textScaler:
                                  TextScaler.linear(Get.textScaleFactor),
                              textAlign: TextAlign.center,
                              maxLines: 1,
                            ),
                          ),
                          DataCell(
                            Text(
                              "${controller!.orderHistoryModel!.result!.elementAt(index).productName}",
                              style: Get.theme.textTheme.titleSmall!,
                              overflow: TextOverflow.ellipsis,
                              textScaler:
                                  TextScaler.linear(Get.textScaleFactor),
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

  Widget _showListView() => ListView.builder(
      itemCount: controller!.orderHistoryModel!.result!.length,
      itemBuilder: (context, index) => _showOrderCard(
          controller!.orderHistoryModel!.result!.elementAt(index),index));

  Widget _showOrderCard(Result model,int index) => Container(
    decoration: BoxDecoration(
      color: index.isEven ? Colors.white60 : Colors.white70,
      border: Border.all(color: Colors.grey,width: 0.2),
      borderRadius: BorderRadius.all(Radius.circular(8.0))
    ),
        margin: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
        child: Card(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Row(
              children: [
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                        overflow: TextOverflow.ellipsis,
                        textScaler: TextScaler.linear(Get.textScaleFactor),
                        textAlign: TextAlign.center,
                        text: TextSpan(text: "Order Date: ",
                            style: Get.theme.textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w600),
                            children: <TextSpan>[
                          TextSpan(
                            text: "${AppConstant.getDateFormat.format(model.createdAt!)}",
                            style: Get.theme.textTheme.titleSmall!,
                          )
                        ])),
                    RichText(
                        overflow: TextOverflow.ellipsis,
                        textScaler: TextScaler.linear(Get.textScaleFactor),
                        textAlign: TextAlign.center,
                        text: TextSpan(text: "Quantity: ",
                            style: Get.theme.textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w600),
                            children: <TextSpan>[
                              TextSpan(
                                text: "${model.quantity}",
                                style: Get.theme.textTheme.titleSmall!,
                              )
                            ])),
                    RichText(
                        overflow: TextOverflow.ellipsis,
                        textScaler: TextScaler.linear(Get.textScaleFactor),
                        textAlign: TextAlign.center,
                        text: TextSpan(text: "Product Name: ",
                            style: Get.theme.textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w600),
                            children: <TextSpan>[
                              TextSpan(
                                text: "${model.productName}",
                                style: Get.theme.textTheme.titleSmall!,
                              )
                            ])),
                    RichText(
                        overflow: TextOverflow.ellipsis,
                        textScaler: TextScaler.linear(Get.textScaleFactor),
                        textAlign: TextAlign.center,
                        text: TextSpan(text: "Order Status: ",
                            style: Get.theme.textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w600),
                            children: <TextSpan>[
                              TextSpan(
                                text: "${model.orderStatus}",
                                style: Get.theme.textTheme.titleSmall!.copyWith(color: model.orderStatus!.toLowerCase() == "success" ? Colors.green : Colors.red,fontWeight: FontWeight.w800),
                              )
                            ])),

                  ],
                )),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green
                    ),
                    onPressed: (){
                      Get.bottomSheet(ShowOrderDetailSheet(model: model,));
                    },

                    child: Text(
                        "View",
                      style: Get.theme.textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w600,color: Colors.white),
                      overflow: TextOverflow.ellipsis,
                      textScaler: TextScaler.linear(Get.textScaleFactor),
                      textAlign: TextAlign.center,

                    ))
              ],
            ),
          ),
        ),
      );
}


class ShowOrderDetailSheet extends StatelessWidget {
  final Result? model;
  const ShowOrderDetailSheet({Key? key,this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        color: Colors.white,
        //borderRadius: BorderRadius.only(topRight: Radius.circular(10.0),topLeft: Radius.circular(10.0))
      ),
      child: Column(
        children: [
          AppBar(
            title: Text("Order Details"),
          ),
          const SizedBox(height: 10.0,),
          _showOrderCard(),
          _showTransportType(),
          _showShippingAddress(),
        ],
      ),
    );
  }

  Widget _showOrderCard() => Container(
    decoration: BoxDecoration(
        color: Colors.white70,
        border: Border.all(color: Colors.grey,width: 0.2),
        borderRadius: BorderRadius.all(Radius.circular(8.0))
    ),
    margin: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
    child: Card(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: Row(
          children: [
            Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                        overflow: TextOverflow.ellipsis,
                        textScaler: TextScaler.linear(Get.textScaleFactor),
                        textAlign: TextAlign.center,
                        text: TextSpan(text: "Order Date: ",
                            style: Get.theme.textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w600),
                            children: <TextSpan>[
                              TextSpan(
                                text: "${AppConstant.getDateFormat.format(model!.createdAt!)}",
                                style: Get.theme.textTheme.titleSmall!,
                              )
                            ])),
                    RichText(
                        overflow: TextOverflow.ellipsis,
                        textScaler: TextScaler.linear(Get.textScaleFactor),
                        textAlign: TextAlign.center,
                        text: TextSpan(text: "Quantity: ",
                            style: Get.theme.textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w600),
                            children: <TextSpan>[
                              TextSpan(
                                text: "${model!.quantity}",
                                style: Get.theme.textTheme.titleSmall!,
                              )
                            ])),
                    RichText(
                        overflow: TextOverflow.ellipsis,
                        textScaler: TextScaler.linear(Get.textScaleFactor),
                        textAlign: TextAlign.center,
                        text: TextSpan(text: "Product Name: ",
                            style: Get.theme.textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w600),
                            children: <TextSpan>[
                              TextSpan(
                                text: "${model!.productName}",
                                style: Get.theme.textTheme.titleSmall!,
                              )
                            ])),
                    RichText(
                        overflow: TextOverflow.ellipsis,
                        textScaler: TextScaler.linear(Get.textScaleFactor),
                        textAlign: TextAlign.center,
                        text: TextSpan(text: "Order Status: ",
                            style: Get.theme.textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w600),
                            children: <TextSpan>[
                              TextSpan(
                                text: "${model!.orderStatus}",
                                style: Get.theme.textTheme.titleSmall!.copyWith(color: model!.orderStatus!.toLowerCase() == "success" ? Colors.green : Colors.red,fontWeight: FontWeight.w800),
                              )
                            ])),

                  ],
                ))
          ],
        ),
      ),
    ),
  );

  Widget _showTransportType() => Container(
    decoration: BoxDecoration(
        color: Colors.white70,
        border: Border.all(color: Colors.grey,width: 0.2),
        borderRadius: BorderRadius.all(Radius.circular(8.0))
    ),
    margin: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
    child: Card(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: Text("Mode of Transport: ",

              style: Get.theme.textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w600),
              overflow: TextOverflow.ellipsis,
              textScaler: TextScaler.linear(Get.textScaleFactor),
              textAlign: TextAlign.start,
            )),
            Expanded(child: Text(model!.modeOfTransport ?? "",

              style: Get.theme.textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w400,),
              overflow: TextOverflow.ellipsis,
              textScaler: TextScaler.linear(Get.textScaleFactor),
              textAlign: TextAlign.end,
            )),
          ],
        ),
      ),
    ),
  );

  Widget _showShippingAddress() => Container(
    width: Get.width,
    decoration: BoxDecoration(
        color: Colors.white70,
        border: Border.all(color: Colors.grey,width: 0.2),
        borderRadius: BorderRadius.all(Radius.circular(8.0))
    ),
    margin: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
    child: Card(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Shipping Address",

              style: Get.theme.textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w600),
              overflow: TextOverflow.ellipsis,
              textScaler: TextScaler.linear(Get.textScaleFactor),
              textAlign: TextAlign.start,
            ),
            Text(model!.shippingAddress!.fullAddress ?? "",
              style: Get.theme.textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w400,),
              overflow: TextOverflow.ellipsis,
              textScaler: TextScaler.linear(Get.textScaleFactor),
              textAlign: TextAlign.end,
            ),
            Text("${model!.shippingAddress!.district ?? ""}, ${model!.shippingAddress!.state ?? ""}",
              style: Get.theme.textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w400,),
              overflow: TextOverflow.ellipsis,
              textScaler: TextScaler.linear(Get.textScaleFactor),
              textAlign: TextAlign.end,
            ),
            Text("Pin Code: ${model!.shippingAddress!.pinCode ?? ""}",
              style: Get.theme.textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w400,),
              overflow: TextOverflow.ellipsis,
              textScaler: TextScaler.linear(Get.textScaleFactor),
              textAlign: TextAlign.end,
            ),
            Text("GST: ${model!.shippingAddress!.gstId ?? ""}",
              style: Get.theme.textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w400,),
              overflow: TextOverflow.ellipsis,
              textScaler: TextScaler.linear(Get.textScaleFactor),
              textAlign: TextAlign.end,
            )
          ],
        ),
      ),
    ),
  );

}
