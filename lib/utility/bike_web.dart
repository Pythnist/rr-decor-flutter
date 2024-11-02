import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ots/ots.dart';
import 'package:rr_decor_flutter/utility/app_constant.dart';
import 'package:rr_decor_flutter/utility/utility.dart';
import 'package:webview_flutter/webview_flutter.dart';


class RRDecorWeb extends StatefulWidget {
  final String url = Get.arguments[0];
  final String title = Get.arguments[1];
  // final String url = AppConstant.termAndConditionUrl;
  // final String title = "Terms";
  RRDecorWeb({Key? key}) : super(key: key);

  @override
  _SchoolWebState createState() => _SchoolWebState();
}

class _SchoolWebState extends State<RRDecorWeb> {
  WebViewController? webViewController;
  int progressBar = 0;

  @override
  void dispose() {
    // TODO: implement dispose


    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    curr();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0.0,
        title: Text(widget.title,style: Get.theme.textTheme.titleMedium!.copyWith(color: Colors.white),),
      ),
      // body: Builder(builder: (BuildContext context) {
      //   return progressBar >= 100 ? (controller: webViewController!) : Utility.progressIndicator();
      // }),
      body: WebViewWidget(controller: webViewController!),
      //body: progressBar >= 100 ? WebViewWidget(controller: webViewController!) : Utility.progressIndicator(),
    );
  }


  void curr(){
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            Get.log("progress::: ${progress}");
            // Update loading bar.
            1.delay().then((v){
              setState(() {
                progressBar = progress;
              });
            });
          },
          onPageStarted: (String url) {
            Get.log("started");
          },
          onPageFinished: (String url) {
            Get.log("finished");
            progressBar = 101;
          },
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

}