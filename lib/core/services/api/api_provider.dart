import 'package:bookia/core/services/api/api_endpoints.dart';
import 'package:dio/dio.dart';

class DioProvider {
  static late Dio dio;
  static Future<void> init() async {
    dio = Dio(BaseOptions(baseUrl: ApiEndpoints.baseUrl));
  }

  static Future<Response> post({
    required String endPoint,
    Object? data,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
  }) async {
    return await dio.post(
      endPoint,
      data: data,
      queryParameters: queryParams,
      options: Options(headers: headers),
    );
  }

  static Future<Response> get({
    required String endPoint,
    Object? data,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
  }) async {
    return await dio.get(
      endPoint,
      data: data,
      queryParameters: queryParams,
      options: Options(headers: headers),
    );
  }

  static Future<Response> put({
    required String endPoint,
    Object? data,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
  }) async {
    return await dio.put(
      endPoint,
      data: data,
      queryParameters: queryParams,
      options: Options(headers: headers),
    );
  }

  static Future<Response> delete({
    required String endPoint,
    Object? data,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
  }) async {
    return await dio.delete(
      endPoint,
      data: data,
      queryParameters: queryParams,
      options: Options(headers: headers),
    );
  }
}
