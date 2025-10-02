import 'dart:developer';

import 'package:bookia/core/services/api/api_endpoints.dart';
import 'package:bookia/core/services/api/api_provider.dart';
import 'package:bookia/core/services/local/local_helper.dart';
import 'package:bookia/features/cart/data/models/cart_response/cart_response.dart';
import 'package:dio/dio.dart';

class CartRepo {
  static Future<CartResponse?> addToCart({required int bookId}) async {
    try {
      var userData = await LocalHelper.getUserdata();
      var res = await DioProvider.post(
        headers: {"Authorization": "Bearer ${userData?.token}"},
        endPoint: ApiEndpoints.addToCart,
        data: {"product_id": bookId},
      );

      if (res.statusCode == 201) {
        var data = CartResponse.fromJson(res.data);
        //LocalHelper.setCart(data.data?.cartItems);
        return data;
      } else {
        return null;
      }
    } on DioException catch (e) {
      log('Dio error: ${e.response?.data}');
      log(e.toString());
      return null;
    }
  }

  static Future<CartResponse?> removeFromCart({required int cartItemId}) async {
    try {
      final userData = await LocalHelper.getUserdata();
      var res = await DioProvider.post(
        headers: {"Authorization": "Bearer ${userData?.token}"},
        endPoint: ApiEndpoints.removeFromCart,
        data: {"cart_item_id": cartItemId},
      );

      if (res.statusCode == 200) {
        var data = CartResponse.fromJson(res.data);
        LocalHelper.setCart(data.data?.cartItems);
        return data;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }


 static Future<CartResponse?> updateCart({required int cartItemId, required int quantity}) async {
    try {
      final userData = await LocalHelper.getUserdata();
      var res = await DioProvider.post(
        headers: {"Authorization": "Bearer ${userData?.token}"},
        endPoint: ApiEndpoints.updateCart,
        data: {"cart_item_id": cartItemId,"quantity":quantity},
      );
log(  res.data.toString());
      if (res.statusCode == 201) {
         log( res.data.toString());
        var data = CartResponse.fromJson(res.data);
        LocalHelper.setCart(data.data?.cartItems);
        return data;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }


  static Future<CartResponse?> getCart() async {
    try {
      var userData = await LocalHelper.getUserdata();
      var res = await DioProvider.get(
        headers: {"Authorization": "Bearer ${userData?.token}"},
        endPoint: ApiEndpoints.cart,
      );

      if (res.statusCode == 200) {
      
        var data = CartResponse.fromJson(res.data);
        // LocalHelper.setCart(data.data?.data);
        return data;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
}
