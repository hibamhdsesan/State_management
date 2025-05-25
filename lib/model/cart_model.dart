// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:bloc_repositry/model/product_model.dart';
import 'package:flutter/foundation.dart';

class ResultData {}

class ErrorData extends ResultData{
  String message;
  ErrorData({
    required this.message,
  });
}

class CartModel extends ResultData {
  List<ProductModel> prodcuts;
  int id;
  double totalPrice;
  CartModel({
    required this.prodcuts,
    required this.id,
    required this.totalPrice,
  });


  CartModel copyWith({
    List<ProductModel>? prodcuts,
    int? id,
    double? totalPrice,
  }) {
    return CartModel(
      prodcuts: prodcuts ?? this.prodcuts,
      id: id ?? this.id,
      totalPrice: totalPrice ?? this.totalPrice,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'prodcuts': prodcuts.map((x) => x.toMap()).toList(),
      'id': id,
      'totalPrice': totalPrice,
    };
  }

  factory CartModel.fromMap(List<dynamic> map) {
    return CartModel(
      prodcuts: List.generate(map.length, (index) => ProductModel.fromMap(map[index]),),
      id: 1,
      totalPrice: 0,
    );
  }

//   factory CartModel.fromMap(Map<String, dynamic> map) {
//   return CartModel(
//     prodcuts: List<ProductModel>.from(
//       map['products'].map((x) => ProductModel.fromMap(x)),
//     ),
//     id: map['id'],
//     totalPrice: (map['totalPrice'] as num).toDouble(),
//   );
// }

  String toJson() => json.encode(toMap());


  @override
  String toString() => 'CartModel(prodcuts: $prodcuts, id: $id, totalPrice: $totalPrice)';


  calculatePrice(){
   double temptotalPrice = 0;
    for (var i = 0; i < prodcuts.length; i++) {
      temptotalPrice=temptotalPrice+ prodcuts[i].price*prodcuts[i].quintity;
    }
    totalPrice=temptotalPrice;
  }

  @override
  bool operator ==(covariant CartModel other) {
    if (identical(this, other)) return true;
  
    return 
      listEquals(other.prodcuts, prodcuts) &&
      other.id == id &&
      other.totalPrice == totalPrice;
  }

  @override
  int get hashCode => prodcuts.hashCode ^ id.hashCode ^ totalPrice.hashCode;
}
