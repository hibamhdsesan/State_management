// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'cart_bloc.dart';

@immutable
sealed class CartState  {}

final class CartInitial extends CartState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}


class CartLoaded extends CartState {
  CartModel cart;
  CartLoaded({
    required this.cart,
  });
  

  // TODO: find why state does not meaning for blocBuilder to rebuild himself
  @override
  List<Object?> get props => [cart.prodcuts.first.quintity];
}

class ErrorToLoad extends CartState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}


class Productloaded extends CartState {
  ProductModel product;
  Productloaded({
    required this.product,
  });
  
  @override
  // TODO: implement props
  List<Object?> get props => [product.quintity];
 }


class LoadingCart extends CartState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}