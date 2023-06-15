import 'dart:io';
import 'package:dio/dio.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:ispection/helper/stroage_helper.dart';
import 'package:ispection/utils/app_string.dart';

import '../helper/data_helper.dart';
import 'api_url.dart';
import 'method.dart';

///---- run command using json serialization---///
///----  flutter pub run build_runner build --delete-conflicting-outputs ----///
///---- flutter pub run build_runner build ----///

class RestClient extends GetxService {
  late Dio _dio;

  String aToken = '';

  //this is for header
  static header() => {
        'Content-Type': 'application/json',
        "Access-Control-Allow-Credentials":
            true, // Required for cookies, authorization headers with HTTPS
        "Access-Control-Allow-Headers":
            "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
        "Access-Control-Allow-Methods":
            "POST, OPTIONS, GET, PUT, DELETE, PATCH "

      };

  Future<RestClient> init() async {
    _dio = Dio(BaseOptions(baseUrl: ApiUrl.getJobs ,/*headers: header(),*/
    ));
    initInterceptors();
    return this;
  }

  void initInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
    DataHelper.debugPrintLog("=============>ACCESS_TOKEN", (StorageHelper.readData(AppStorageKeys.ACCESS_TOKEN)));
      if(StorageHelper.readData(AppStorageKeys.ACCESS_TOKEN) != null){
        options.headers['Authorization'] = "Bearer ${StorageHelper.readData(AppStorageKeys.ACCESS_TOKEN)}";
      }
      else{
                options.headers['Authorization'] = "Bearer ${AppStorageKeys.job}";
      }

      DataHelper.debugPrintLog("header","${options.headers.toString()}");
      return handler.next(options);
    }, onResponse: (response, handler) {
      DataHelper.debugPrintLog("RESPONSE",'[${response.statusCode}] => DATA: ${response.data}');
      return handler.next(response);
    }, onError: (err, handler) {
      DataHelper.debugPrintLog("ERROR",err);
      return handler.next(err);
    }));
  }

  Future<dynamic> request(
      String url,
      Method method,
      Map<String, dynamic> params,
      Map<String, dynamic> queryParams,
      FormData formData) async {
    Response response;

    init();

    String baseUrl = "";
    if (url.contains(ApiUrl.getJobs)) {
      baseUrl = url;
    } else {
      baseUrl = "${ApiUrl.getJobs}$url";
    }

    DataHelper.debugPrintLog("base url ","$baseUrl,,, $params,,,, ${queryParams}");


    try {
      if (method == Method.POST) {
        if (queryParams.isNotEmpty) {
          response = await _dio.post(baseUrl,data: queryParams, queryParameters: params,
          );
        } else if (formData.fields.isNotEmpty) {
          response = await _dio.post(baseUrl, data: formData);
        } else {
          response = await _dio.post(baseUrl, data: params);
        }
      } else if (method == Method.DELETE) {
        response = await _dio.delete(url);
      } else if (method == Method.PATCH) {
        response = await _dio.patch(url);
      } else {
        response = await _dio.get(
          url,
          queryParameters: params,
        );
      }

      DataHelper.debugPrintLog("response", response.data);
      if (response.statusCode == 200) {
        return response.data;
      } else if (response.statusCode == 401) {
         return response.data;
      }else if (response.statusCode == 404) {
         return response.data;
      }  
      else if (response.statusCode == 500) {
        throw Exception("Server Error");
      } else {
        throw Exception("Something Went Wrong");
      }
    } on DioError catch (e) {
      return e.response!.data;
    }on SocketException catch (e) {
      throw Exception("No Internet Connection ${e.message}");
    } on FormatException {
      throw Exception("Bad Response Format!");
    }
  }
}
