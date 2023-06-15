import 'package:dio/dio.dart';
import 'package:ispection/api_service/api_url.dart';
import 'package:ispection/api_service/base_Controller.dart';
import 'package:ispection/api_service/method.dart';
import 'package:ispection/api_service/rest_client.dart';
import 'package:ispection/helper/data_helper.dart';

import 'homePageModel/homePagemodel.dart';

class LoginController extends BaseController {
  Future<LoginPageModel> callLoginApi(
    String email,
    String password,
    String type,
  ) async {
    LoginPageModel ? dataModel;
    try {
      final params = <String, dynamic>{};
      final map = <String, dynamic>{};
      map['email'] = email;
      map['type'] = type;
      map['password'] = password;

      final formData = FormData.fromMap({
     
      });

      restClient = RestClient();
      final result = await restClient!
          .request(ApiUrl.getJobs, Method.POST, params, map, formData);
          DataHelper.debugPrintLog("loginResult", result);
      if (result != null) {
        dataModel = LoginPageModel.fromJson(result);
        // StorageHelper.writeData("userId", id);
        return dataModel;
      }
      //return dataModel!;
    } catch (e) {
      
      rethrow;
    }

    return dataModel!;
  }
}