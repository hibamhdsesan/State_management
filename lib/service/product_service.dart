import 'package:bloc_repositry/model/cart_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';


class ProductService {
  Dio requestHandler;
  late Response response;
  String baseurl = "https://682b3419d29df7a95be27be0.mockapi.io/product";
  ProductService({required this.requestHandler});
  CartModel? cartModel;
  Future<ResultData> getCart() async {
    if (cartModel==null) {
      print("From Network");
    try { 
      response = await requestHandler.get(baseurl);
      cartModel= CartModel.fromMap(response.data);
      return cartModel!;
    } catch (e) {
      return ErrorData(message: e.toString());
    }
    }else {
      print("From Cache");
      return cartModel!;
    }
  }
}
