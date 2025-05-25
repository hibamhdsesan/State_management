// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:bloc_repositry/model/cart_model.dart';
import 'package:bloc_repositry/model/product_model.dart';
import 'package:bloc_repositry/repository/product_repository.dart';
import 'package:bloc_repositry/service/product_service.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartModel cart = CartModel(
    prodcuts: [],
    id: 1,
    totalPrice: 0,
  );
  // ProductService productService = ProductService(requestHandler: Dio());
  ProductRepository productRepository;
  CartBloc(
    this.productRepository
  ) : super(CartInitial()) {
    on<ViewCart>((event, emit) async {
      emit(LoadingCart());
      ResultData data = await productRepository.getCart();
      if (data is CartModel) {
        cart.prodcuts = data.prodcuts;
        cart.calculatePrice();
        emit(CartLoaded(cart: cart));
      } else {
        data as ErrorData;
        print(data.message);
        emit(ErrorToLoad());
      }
    });

    on<IncreasProductQuintity>((event, emit) {
      print(state);
      for (var i = 0; i < cart.prodcuts.length; i++) {
        if (cart.prodcuts[i].id == event.id) {
          cart.prodcuts[i].quintity++;
        }
      }
      cart.calculatePrice();
      print(state);
      emit(CartLoaded(cart: cart));
    });

    on<ViewOneProduct>(
      (event, emit) {
        emit(Productloaded(
            product: cart.prodcuts.firstWhere(
          (element) => element.id == event.id,
        )));
      },
    );

    on<IncreasProductQuintityFromDetails>((event, emit) {
      for (var i = 0; i < cart.prodcuts.length; i++) {
        if (cart.prodcuts[i].id == event.id) {
          cart.prodcuts[i].quintity++;
        }
      }
      cart.calculatePrice();
      emit(Productloaded(
          product: cart.prodcuts.firstWhere(
        (element) => element.id == event.id,
      )));
    });
  }
}
