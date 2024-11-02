import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ots/ots.dart';
import 'package:rr_decor_flutter/checkout/controller/ledger_controller.dart';
import 'package:rr_decor_flutter/model/ledger_model.dart' as LedgerM;
import '../../utility/app_constant.dart';
import '../../utility/validators.dart';

class LedgetScreen extends GetView<LedgerController> {
  const LedgetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LedgerController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Ledger"),
      ),
      body: GetBuilder<LedgerController>(
        init: controller,
        builder: (controller) => LedgerView(
          controller: controller,
        ),
      ),
    );
  }
}

class LedgerView extends StatelessWidget {
  final LedgerController? controller;
  const LedgerView({Key? key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          const SizedBox(
            height: 20.0,
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller!.startDateController,
                  validator: AppValidators.noBlankValidatior,
                  maxLines: 1,
                  readOnly: true,
                  onTap: () async {
                    await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1955),
                            lastDate: DateTime(1955 + 70),
                            initialEntryMode: DatePickerEntryMode.calendarOnly)
                        .then((selectedDate) {
                      if (selectedDate != null) {
                        controller!.startDate = selectedDate;
                        controller!.startDateController!.text =
                            AppConstant.getDateFormat.format(selectedDate);
                        controller!.endDateController!.clear();
                        controller!.endDate = null;
                        // controller!.generalProfileModel!.dob = AppConstant.getDateFormat.format(selectedDate);
                      }
                    });
                  },
                  style: Get.theme.textTheme.bodyMedium!
                      .copyWith(color: Color(0xff1a1c1e)),
                  decoration: InputDecoration(
                    hintText: 'Start Date',
                    labelText: 'Start Date',
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
              ),
              const SizedBox(
                width: 5.0,
              ),
              Expanded(
                child: TextFormField(
                  controller: controller!.endDateController,
                  validator: AppValidators.noBlankValidatior,
                  maxLines: 1,
                  readOnly: true,
                  onTap: () async {
                    if (controller!.startDateController!.text.isNotEmpty) {
                      await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1955),
                              lastDate: DateTime(1955 + 70),
                              initialEntryMode:
                                  DatePickerEntryMode.calendarOnly)
                          .then((selectedDate) {
                        if (selectedDate != null) {
                          controller!.endDate = selectedDate;
                          controller!.endDateController!.text =
                              AppConstant.getDateFormat.format(selectedDate);
                          // controller!.generalProfileModel!.dob = AppConstant.getDateFormat.format(selectedDate);
                        }
                      });
                    } else {
                      bakeToast("Select Start Date First",
                          type: ToastType.error);
                    }
                  },
                  style: Get.theme.textTheme.bodyMedium!
                      .copyWith(color: Color(0xff1a1c1e)),
                  decoration: InputDecoration(
                    hintText: 'End Date',
                    labelText: 'End Date',
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
              )
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            children: [
              Expanded(child: ElevatedButton(
                  onPressed: () {
                    if(controller!.startDateController!.text.isNotEmpty && controller!.endDateController!.text.isNotEmpty){
                      controller!.fetchData();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Get.theme.primaryColor),
                  child: Text(
                    "Search",
                    style: Get.theme.textTheme.titleSmall!
                        .copyWith(fontWeight: FontWeight.w400, color: Colors.white),
                    overflow: TextOverflow.ellipsis,
                    textScaler: TextScaler.linear(Get.textScaleFactor),
                    textAlign: TextAlign.end,
                  )),),
              Visibility(
                  visible: (controller!.startDateController!.text.isNotEmpty && controller!.endDateController!.text.isNotEmpty),
                  child: const SizedBox(width: 10.0,)),
              Visibility(
                  visible: (controller!.startDateController!.text.isNotEmpty && controller!.endDateController!.text.isNotEmpty),
                  child: Expanded(child: ElevatedButton(
                  onPressed: () {
                    if(controller!.startDateController!.text.isNotEmpty && controller!.endDateController!.text.isNotEmpty){
                      controller!.endDateController!.clear();
                      controller!.startDateController!.clear();
                      controller!.startDate = null;
                      controller!.endDate = null;
                      controller!.ledgerList = [];
                      controller!.ledgerModel = LedgerM.LedgerModel(statusCode: 200,response: []);
                      controller!.update();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Get.theme.primaryColor),
                  child: Text(
                    "Reset",
                    style: Get.theme.textTheme.titleSmall!
                        .copyWith(fontWeight: FontWeight.w400, color: Colors.white),
                    overflow: TextOverflow.ellipsis,
                    textScaler: TextScaler.linear(Get.textScaleFactor),
                    textAlign: TextAlign.end,
                  )),))
            ],
          ),
          Expanded(child: controller!.ledgerModel!.response!.isNotEmpty ? _showListView() : _showNoDataAvailable())
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
          "No Data Available",
          style: Get.theme.textTheme.titleLarge,
        )
      ],
    ),
  );

  Widget _showListView() => ListView.builder(
      itemCount: controller!.ledgerList.length,

      itemBuilder: (context, index) => _showOrderCard(
          controller!.ledgerList.elementAt(index),index));

  Widget _showOrderCard(LedgerM.Response model,int index) => Container(
    decoration: BoxDecoration(
        color: index.isEven ? Colors.white60 : Colors.white70,
        border: Border.all(color: Colors.grey,width: 0.2),
        borderRadius: BorderRadius.all(Radius.circular(8.0))
    ),
    margin: EdgeInsets.symmetric(horizontal: 0.0,vertical: 5.0),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Document Type:",
                          style: Get.theme.textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w600),
                          overflow: TextOverflow.ellipsis,
                          textScaler: TextScaler.linear(Get.textScaleFactor),
                          textAlign: TextAlign.start,
                        ),
                        Text(
                          model.documentType ?? "N/A",
                          style: Get.theme.textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w500),
                          overflow: TextOverflow.ellipsis,
                          textScaler: TextScaler.linear(Get.textScaleFactor),
                          textAlign: TextAlign.start,
                        )
                      ],
                    ),
                    const SizedBox(height: 5.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          [""," ","null",null,"Payment","payment"].contains(model.documentType!) ? "Credited: " :  "Debited: ",
                          style: Get.theme.textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w600,color: [""," ","null",null,"Payment","payment"].contains(model.documentType!) ? Colors.green : Colors.red),
                          overflow: TextOverflow.ellipsis,
                          textScaler: TextScaler.linear(Get.textScaleFactor),
                          textAlign: TextAlign.start,
                        ),
                        Text(
                          "${AppConstant.currencyUnicode}${[""," ","null",null,"Payment","payment"].contains(model.documentType!) ? model.creditAmount!.toStringAsFixed(2) : model.debitAmount!.toStringAsFixed(2)}",
                          style: Get.theme.textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w500,color: [""," ","null",null,"Payment","payment"].contains(model.documentType!) ? Colors.green : Colors.red),
                          overflow: TextOverflow.ellipsis,
                          textScaler: TextScaler.linear(Get.textScaleFactor),
                          textAlign: TextAlign.start,
                        )
                      ],
                    ),
                    const SizedBox(height: 5.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Balance",
                          style: Get.theme.textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w600),
                          overflow: TextOverflow.ellipsis,
                          textScaler: TextScaler.linear(Get.textScaleFactor),
                          textAlign: TextAlign.start,
                        ),
                        Text(
                          "${AppConstant.currencyUnicode}${model.totalBalance!.toStringAsFixed(2)}",
                          style: Get.theme.textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w500),
                          overflow: TextOverflow.ellipsis,
                          textScaler: TextScaler.linear(Get.textScaleFactor),
                          textAlign: TextAlign.start,
                        )
                      ],
                    ),
                    const SizedBox(height: 5.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Posting Date",
                          style: Get.theme.textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w600),
                          overflow: TextOverflow.ellipsis,
                          textScaler: TextScaler.linear(Get.textScaleFactor),
                          textAlign: TextAlign.start,
                        ),
                        Text(
                          "${AppConstant.getDateFormat.format(model.postingDate!)}",
                          style: Get.theme.textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w500),
                          overflow: TextOverflow.ellipsis,
                          textScaler: TextScaler.linear(Get.textScaleFactor),
                          textAlign: TextAlign.start,
                        )
                      ],
                    ),
                    const SizedBox(height: 5.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Document No.",
                          style: Get.theme.textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w600),
                          overflow: TextOverflow.ellipsis,
                          textScaler: TextScaler.linear(Get.textScaleFactor),
                          textAlign: TextAlign.start,
                        ),
                        Text(
                          "${model.documentNumber}",
                          style: Get.theme.textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w500),
                          overflow: TextOverflow.ellipsis,
                          textScaler: TextScaler.linear(Get.textScaleFactor),
                          textAlign: TextAlign.start,
                        )
                      ],
                    ),


                  ],
                )),

          ],
        ),
      ),
    ),
  );
}
