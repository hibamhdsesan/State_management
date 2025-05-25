// import 'package:bloc_repositry/model/cart_model.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';


// class ProductService {
//   Dio requestHandler;
//   late Response response;
//   String baseurl = "https://682b3419d29df7a95be27be0.mockapi.io/product";
//   ProductService({required this.requestHandler});
//   CartModel? cartModel;
//   Future<ResultData> getCart() async {
//     if (cartModel==null) {
//       print("From Network");
//     try { 
//       response = await requestHandler.get(baseurl);
//       cartModel= CartModel.fromMap(response.data);
//       return cartModel!;
//     } catch (e) {
//       return ErrorData(message: e.toString());
//     }
//     }else {
//       print("From Cache");
//       return cartModel!;
//     }
//   }
// }

import 'dart:io';

import 'package:bloc_repositry/model/cart_model.dart';
import 'package:dio/dio.dart';

import 'dart:convert';
import 'package:path_provider/path_provider.dart';


class ProductService {
  Dio requestHandler;
  String baseurl = "https://682b3419d29df7a95be27be0.mockapi.io/product";

  ProductService({required this.requestHandler});

  // اسم الملف اللي رح نخزن فيه بيانات الكارت
  final String _cartFileName = 'cart_data.json';

  // دالة تحصل على ملف التخزين (مسار الملف)
  Future<File> _getLocalFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/$_cartFileName');
  }

  // دالة لقراءة بيانات الكارت من الملف لو موجودة
  Future<CartModel?> _readCartFromFile() async {
    try {
      final file = await _getLocalFile();
      if (await file.exists()) {
        final contents = await file.readAsString();
        final data = jsonDecode(contents);
        return CartModel.fromMap(data);
      }
    } catch (e) {
      print("Error reading cart file: $e");
    }
    return null;
  }

  // دالة لحفظ بيانات الكارت في الملف
  Future<void> _writeCartToFile(CartModel cart) async {
    try {
      final file = await _getLocalFile();
      final data = jsonEncode(cart.toMap());
      await file.writeAsString(data);
    } catch (e) {
      print("Error writing cart file: $e");
    }
  }

  Future<ResultData> getCart() async {
    // جرب تقرأ من الملف أولاً (cache محلي)
    CartModel? cachedCart = await _readCartFromFile();

    if (cachedCart != null) {
      print("From Local File Cache");
      return cachedCart;
    }

    // إذا ما في cache، جلب من الشبكة وخزن بالملف
    try {
      print("From Network");
      final response = await requestHandler.get(baseurl);
      final cart = CartModel.fromMap(response.data);
      await _writeCartToFile(cart);
      return cart;
    } catch (e) {
      return ErrorData(message: e.toString());
    }
  }
}
