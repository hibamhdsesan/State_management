import 'package:bloc_repositry/model/cart_model.dart';
import 'package:bloc_repositry/service/product_service.dart';

class ProductRepository{
   final ProductService productService;

  ProductRepository({required this.productService});
   Future<ResultData> getCart() async {
    return await productService.getCart();
  }

}