// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProductModel {
  String name;
  num price;
  num quintity;
  String id;
  ProductModel({
    required this.name,
    required this.price,
    required this.quintity,
    required this.id,
  });

  ProductModel copyWith({
    String? name,
    num? price,
    num? quintity,
    String? id,
  }) {
    return ProductModel(
      name: name ?? this.name,
      price: price ?? this.price,
      quintity: quintity ?? this.quintity,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'price': price,
      'quintity': quintity,
      'id': id,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      name: map['name'] as String,
      price: map['price'] ,
      quintity: map['quintity'] ,
      id: map['id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) => ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductModel(name: $name, price: $price, quintity: $quintity, id: $id)';
  }

  @override
  bool operator ==(covariant ProductModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.price == price &&
      other.quintity == quintity &&
      other.id == id;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      price.hashCode ^
      quintity.hashCode ^
      id.hashCode;
  }
}
