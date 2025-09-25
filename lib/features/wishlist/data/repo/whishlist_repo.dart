import 'dart:developer';

import 'package:bookia/core/services/api/api_endpoints.dart';
import 'package:bookia/core/services/api/api_provider.dart';
import 'package:bookia/core/services/local/local_helper.dart';
import 'package:bookia/features/wishlist/data/models/wish_list_response/wish_list_response.dart';
import 'package:dio/dio.dart';

class WishlistRepo {
  static Future<WishListResponse?> addToWishlist({required int bookId}) async {
    try {
       final userData = await LocalHelper.getUserdata();
      var res = await DioProvider.post(
        headers: {"Authorization": "Bearer ${userData.token}"},
        endPoint: ApiEndpoints.addToWishlist,
        data: {"product_id": bookId},
      );

      if (res.statusCode == 200) {
       
        return WishListResponse.fromJson(res.data);
      } else {
        return null;
      }
      
    } on DioException catch (e) {
      log('Dio error: ${e.response?.data}');
      log(e.toString());
      return null;
    }
  }

 static Future<WishListResponse?> removeFromWishlist({required int bookId}) async {
    try {final userData = await LocalHelper.getUserdata();
      var res = await DioProvider.post(
        headers: {"Authorization": "Bearer ${userData.token}"},
        endPoint: ApiEndpoints.removeFromWishlist,
        data: {"product_id": bookId},
      );

      if (res.statusCode == 200) {
        return WishListResponse.fromJson(res.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<WishListResponse?> getWishlist() async {
    try {
      final userData = await LocalHelper.getUserdata();
      var res = await DioProvider.get(
        headers: {"Authorization": "Bearer ${userData.token}"},
        endPoint: ApiEndpoints.wishlist,
      );

      if (res.statusCode == 200) {
        log(userData.token);
        return WishListResponse.fromJson(res.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
}
