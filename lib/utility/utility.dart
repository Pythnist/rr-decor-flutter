import 'dart:convert';
import 'dart:io';




import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ots/ots.dart';
import 'package:url_launcher/url_launcher.dart';


import '../network/storage_repository.dart';
import '../pages/pages.dart';
import 'app_constant.dart';



class Utility {
  static progressIndicator() => Container(
    child: Center(
      child: CircularProgressIndicator(),
    ),
  );
  static inputTextLabel(String value) => Text(
        value,

      );

 static Widget errorInidicator(String errorMessage,void Function() onClick) => Container(
    height: Get.height,
    width: Get.width,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(errorMessage),
        IconButton(icon: Icon(Icons.refresh), onPressed: onClick)
      ],
    ),
  );




  static Widget errorIndicator(void Function()? onClick) => Container(
    height: Get.height,
    width: Get.width,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Lottie.asset(AppConstant.lottieError,width: Get.width,height: Get.height * 0.30),
        Text(
          "Oops !! Something Went Wrong",

        ),
        IconButton(
            onPressed: onClick,
            icon: const Icon(
              Icons.refresh,
              size: 30,
            ))
      ],
    ),
  );

  static InputDecoration getInputDecoration(String hintText) => InputDecoration(
        isDense: true,
        border: OutlineInputBorder(
          borderRadius:
              BorderRadius.all(Radius.circular(AppConstant.buttonRadius)),
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius:
                BorderRadius.all(Radius.circular(AppConstant.buttonRadius))),
        hintText: hintText,
        hintStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.italic,
            color: Colors.grey),
        filled: true,
        fillColor: Color(0xffF4F5F5),
      );

  static showError(String message) {
    showNotification(
        title: "Error!",
        message: message,
        backgroundColor: Colors.red,
        autoDismissible: true,
        //messageStyle: Styles.notificationStyle,
        //titleStyle: Styles.notificationStyle,
        animDuration: 500);
  }

  static showSuccess(String message) {
    showNotification(
        title: "Success!",
        message: message,
        autoDismissible: true,
        backgroundColor: Colors.green,
        // messageStyle: Styles.notificationStyle,
        // titleStyle: Styles.notificationStyle,
        animDuration: 500);
  }

  static showWarning(String message) {
    showNotification(
        title: "Success!",
        message: message,
        autoDismissible: true,
        backgroundColor: Colors.yellowAccent,
        // messageStyle: Styles.notificationStyle,
        // titleStyle: Styles.notificationStyle,
        animDuration: 500);
    // ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
    //   content: Text("${message}"),
    //   backgroundColor: Colors.yellowAccent,
    // ));
  }

  static void loggedOut() {
    StorageRepository.destroyOfflineStorage().then((value){
      Get.offAllNamed(Routes.loginUrl);
    });

  }


  static Widget imageContainer(String url,double height,double width) => CachedNetworkImage(
      height: height,
      width: width,
      imageUrl: url,
      imageBuilder: (context, imageProvider) => Container(
        margin: EdgeInsets.symmetric(horizontal: 5.0),
        height: height,
        width: width,
        decoration: BoxDecoration(
          //shape: shape,
          //border: Border.all(color: Get.theme.primaryColor),
          borderRadius: BorderRadius.all(Radius.circular(5)),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.contain,),
        ),
      ),
      placeholder: (context, url) => Container(
        height: height,
        width: width,
        child: Center(
          child: progressIndicator(),
        ),
      ),
      errorWidget: (context, url, error) => Container(
        height: height,
        width: width,
        child: Center(
          child: Icon(Icons.error),
        ),
      ),

  );



  static Widget profileAvatar(String url,double height,double width,BoxShape shape) => CachedNetworkImage(
    height: height,
    width: width,
    imageUrl: url,
    imageBuilder: (context, imageProvider) => Container(
      height: height,
      width: width,
      //padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Get.theme.colorScheme.secondary.withOpacity(0.1),
        //color: Colors.grey.withOpacity(0.1)
      ),
      child: Container(

        margin: EdgeInsets.symmetric(horizontal: 5.0),
        height: height,
        width: 40,
        decoration: BoxDecoration(
          shape: shape,

          //border: Border.all(color: Get.theme.primaryColor),
          //borderRadius: BorderRadius.all(Radius.circular(5)),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.contain,),
        ),
      ),
    ),
    placeholder: (context, url) => Container(
      height: height,
      width: width,
      child: Center(
        child: progressIndicator(),
      ),
    ),
    errorWidget: (context, url, error) => Container(
      height: height,
      width: width,
      child: Center(
        child: Icon(Icons.error),
      ),
    ),

  );

  static void showLogoutDialog() {
    if (GetPlatform.isAndroid) {
      Get.defaultDialog(
          title: "Logout Confirmation",
          content: Text(
            "Are you sure you want to logout?",


          ),
          onConfirm: () {
            Get.back();
            loggedOut();
          },
          onCancel: () {
            Get.back();
          });
    } else {
      Get.dialog(CupertinoAlertDialog(
        title: Text(
          'Alert',

        ),
        content: Text(
          "Are you sure you want to logout?",


        ),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            child: Text(
              'No',

            ),
            onPressed: () {
              Get.back();
            },
          ),
          CupertinoDialogAction(
            child: Text(
              'Yes',
              textScaleFactor: Get.textScaleFactor,
            ),
            onPressed: () {
              Get.back();
              loggedOut();
            },
          )
        ],
      ));
    }
  }

  static RoundedRectangleBorder cardShapeDecoration() => const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(20.0)));
  
  




  static String getImageBytes(File imagefile) {
    List<int> imageBytes = imagefile.readAsBytesSync();
    //Get.log("qwerty ${base64Encode(imageBytes)}");
    return base64Encode(imageBytes);
  }



  static Widget fieldTitle(String? value,bool isMandatory) => Container(
    margin: const EdgeInsets.symmetric(vertical: 5.0),
    child: RichText(text: TextSpan(
        text: value,
        style: Get.theme.textTheme.titleMedium!.copyWith(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w500),
        children: <TextSpan>[
          TextSpan(
            text: " *",
            style: Get.theme.textTheme.titleMedium!.copyWith(color: isMandatory ? Colors.red : Colors.transparent),
          )
        ]
    )),
  );
  static Widget fieldLabels(String? value,bool isMandatory) => Container(
    margin: const EdgeInsets.symmetric(vertical: 5.0),
    child: RichText(
        textScaler: TextScaler.linear(Get.textScaleFactor),
        text: TextSpan(
        text: value,
        style: TextStyle(fontSize: 15,color: Get.isDarkMode ? Colors.grey : Colors.black),
        children: <TextSpan>[
          TextSpan(
            text: " *",
            style: TextStyle(color: isMandatory ? Colors.red : Colors.transparent,fontSize: 13),
          )
        ]
    )),
  );

  static void showCupertinoDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: Get.context!,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        // The Bottom margin is provided to align the popup above the system
        // navigation bar.
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        // Provide a background color for the popup.
        color: CupertinoColors.systemBackground.resolveFrom(context),
        // Use a SafeArea widget to avoid system overlaps.
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }

  static InputDecoration vNetInputDecoration(String? hint,Widget? prefixWidget,bool? isDense) => InputDecoration(
    //prefixIcon: Image.asset("assets/profile_twelve/search.png"),
    //   prefixIcon: prefixWidget != null ? Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       children: [
    //         //99589SizedBox(height: 5.0,),
    //         Container(margin: EdgeInsets.only(bottom: 4.0),child: prefixWidget,),
    //
    //       ]
    //   ) : null,
      isDense: isDense,
      border:  OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xff79747E),width: 0.5),
        borderRadius: BorderRadius.all(Radius.circular(AppConstant.borderRadius)),
      ),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff79747E),width: 0.5),
          borderRadius: BorderRadius.all(Radius.circular(AppConstant.borderRadius))),
      enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff79747E),width: 0.5),
          borderRadius: BorderRadius.all(Radius.circular(AppConstant.borderRadius))),



      filled: true,
      hintText: hint,
      hintStyle: Get.theme.textTheme.titleSmall!,
      errorStyle: Get.theme.textTheme.bodySmall!.copyWith(color: Colors.red)
    //hintStyle: Get.theme.textTheme.displaySmall

  );

  static void showDialog(String title,String description,void Function()? onConfirm) {
    if (GetPlatform.isAndroid) {
      Get.defaultDialog(
          barrierDismissible: false,
          title: title ?? '',
          content: Text(
            description ?? '',
            textScaleFactor: Get.textScaleFactor,
            textAlign: TextAlign.center,

          ),
          onConfirm: onConfirm,
          confirmTextColor: Colors.white,
          onCancel: () {
            //Get.back();
          });
    } else {
      Get.dialog(CupertinoAlertDialog(

        title: Text(
          title ?? "",
          textScaleFactor: Get.textScaleFactor,
        ),
        content: Text(
          description ?? "",
          textScaleFactor: Get.textScaleFactor,

        ),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            child: Text(
              'No',
              style: Get.theme.textTheme.titleMedium!.copyWith(color: Colors.black),
            ),
            onPressed: () {
              Get.back();
            },
          ),
          CupertinoDialogAction(
            child: Text(
              'Yes',
              style: Get.theme.textTheme.titleMedium!.copyWith(color: Colors.black),
            ),
            onPressed: onConfirm,
          )
        ],
      ),barrierDismissible: false);
    }
  }



  static Future<void> makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  static Future<void> launchUniversalLinkIOS(Uri url) async {
    final bool nativeAppLaunchSucceeded = await launchUrl(
      url,
      mode: LaunchMode.externalNonBrowserApplication,
    );
    if (!nativeAppLaunchSucceeded) {
      await launchUrl(
        url,
        mode: LaunchMode.inAppBrowserView,
      );
    }
  }

  static Future<void> launchInBrowserView(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.inAppBrowserView)) {
      throw Exception('Could not launch $url');
    }
  }

  static Future<void> launchInWebView(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.inAppWebView)) {
      throw Exception('Could not launch $url');
    }
  }








}



