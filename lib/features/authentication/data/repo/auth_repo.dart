import 'dart:developer';

import 'package:bookia/core/services/api/api_endpoints.dart';
import 'package:bookia/core/services/api/api_provider.dart';
import 'package:bookia/features/authentication/data/models/request/auth_params.dart';
import 'package:bookia/features/authentication/data/models/response/auth_response/auth_response.dart';

class AuthRepo {
  static login(AuthParams params) async {
    try {
      var res = await DioProvider.post(
        endPoint: ApiEndpoints.login,
        data: params.toJson(),
      );
      if (res.statusCode == 200) {
        //success and return data
        return AuthResponse.fromJson(res.data);
      } else {
        //error
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<AuthResponse?> register(AuthParams params) async {
    try {
      var res = await DioProvider.post(
        endPoint: ApiEndpoints.register,
        data: params.toJson(),
      );
      if (res.statusCode == 201) {
        //success and return data
        var data = AuthResponse.fromJson(res.data);

        return data;
      } else {
        //error
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
}
