import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';


import '../services/startup_service.dart';
import '../utility/app_config.dart';
import '../utility/utility.dart';
import 'api_path.dart';

class NetworkProvider extends GetConnect {



  @override
  void onInit() {
    // TODO: implement onInit
    httpClient.baseUrl = ApiPath.baseUrl;

    HttpStatus.unauthorized;
    httpClient.maxAuthRetries = 3;


    httpClient.addRequestModifier((Request request) {
      //request.headers["Content-Type"] = 'application/json';
      if(["",null,"null"].contains(StartUpService.token) == false)request.headers[HttpHeaders.authorizationHeader] = 'Token ${StartUpService.token}';

      return request;
    });

    httpClient.addResponseModifier((Request request, Response response) {
      Get.log("Http Status ::: ${request.url} == ${response.statusCode}---${HttpStatus.unauthorized}");
      Get.log("Http Response ::: ${request.url} == ${response.bodyString}");
      if(response.statusCode == HttpStatus.unauthorized){
        //Utility.loggedOut();
        //Get.offAllNamed(Routes.login);
        //bakeToast("Session Expire",type: ToastType.error);
      }
      return response;
    });

    super.onInit();

  }

  Future<Response> getCommonCall(String url,dynamic data) => post(url,jsonEncode(data));
  Future<Response> getCommonCallMulti(String url,dynamic data) => post(url,FormData(data));
  Future<Response> getCommonCallMultiPart(String url,dynamic data) => post(url,FormData(data));

  Future<Response> putCall(String url,dynamic data) => put(url,jsonEncode(data));

  Future<Response> getCommonCallW(String url,dynamic data) => post(url, data);

  Future<Response> getCall(String url) => get(url);

  Future<Response> getCallQuery(String url,dynamic query) => get(url,query: query);
  Future<Response> getDeleteQuery(String url) => delete(url);
}