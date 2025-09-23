import 'dart:developer';

import 'package:bookia/core/services/api/api_endpoints.dart';
import 'package:bookia/core/services/api/api_provider.dart';
import 'package:bookia/core/services/local/local_helper.dart';
import 'package:bookia/features/authentication/data/models/request/auth_params.dart';
import 'package:bookia/features/authentication/data/models/response/auth_response/auth_response.dart';
import 'package:dio/dio.dart';

class AuthRepo {
  static login(AuthParams params) async {
    try {
      var res = await DioProvider.post(
        endPoint: ApiEndpoints.login,
        data: params.toJson(),
      );
      if (res.statusCode == 200) {
        //success and return data
        var data = AuthResponse.fromJson(res.data);
        await LocalHelper.setUserData(data.data!);
        return data;
      } else {
        //error
        log('Login failed: ${res.statusCode} ${res.data}');
        return null;
      }
    } on DioException catch (e) {
      log('Status: ${e.response?.statusCode}');
      log('Error body: ${e.response?.data}');
      return null;
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<AuthResponse?> register(AuthParams params) async {
    try {
      var res = await DioProvider.post(
        endPoint: ApiEndpoints.forgetPassword,
        data: params.toJson(),
      );
      if (res.statusCode == 200) {
        //success and return data
        var data = AuthResponse.fromJson(res.data);

        return data;
      } else {
        //error
        log("forget Password link failed: ${res.statusCode} ${res.data}");

        return null;
      }
    } on DioException catch (e) {
      log('Status: ${e.response?.statusCode}');
      log('Error body: ${e.response?.data}');
      return null;
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<AuthResponse?> forgetPassword(AuthParams params) async {
    try {
      var res = await DioProvider.post(
        endPoint: ApiEndpoints.register,
        data: params.toJson(),
      );
      if (res.statusCode == 201) {
        //success and return data
        var data = AuthResponse.fromJson(res.data);
        await LocalHelper.setUserData(data.data!);
        return data;
      } else {
        //error
        log('Register failed: ${res.statusCode} ${res.data}');

        return null;
      }
    } on DioException catch (e) {
      log('Status: ${e.response?.statusCode}');
      log('Error body: ${e.response?.data}');
      return null;
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
}
