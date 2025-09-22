import 'dart:developer';

import 'package:bookia/core/services/api/api_endpoints.dart';
import 'package:bookia/core/services/api/api_provider.dart';
import 'package:bookia/features/home/data/models/books_response/books_response.dart';
import 'package:bookia/features/home/data/models/slider_response/slider_response.dart';

class HomeRepo {
  static Future<SliderResponse?> getSlider() async {
    try {
      var res = await DioProvider.get(endPoint: ApiEndpoints.slider);
      if (res.statusCode == 200) {
        return SliderResponse.fromJson(res.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<BooksResponse?> getBestSellers() async {
    try {
      var res = await DioProvider.get(endPoint: ApiEndpoints.bestSellers);
      if (res.statusCode == 200) {
        return BooksResponse.fromJson(res.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<BooksResponse?> getNewArrivals() async {
    try {
      var res = await DioProvider.get(endPoint: ApiEndpoints.newArrivals);
      if (res.statusCode == 200) {
        return BooksResponse.fromJson(res.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<BooksResponse?> getAllProducts([int pageIndex = 1]) async {
    try {
      var res = await DioProvider.get(
        endPoint: ApiEndpoints.allProducts,
        queryParams: {"page": pageIndex},
      );
      if (res.statusCode == 200) {
        return BooksResponse.fromJson(res.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
}
