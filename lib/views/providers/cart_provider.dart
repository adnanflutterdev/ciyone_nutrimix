import 'package:ciyone_nutrimix/models/cart_model.dart';
import 'package:ciyone_nutrimix/models/new_product_model.dart';
import 'package:ciyone_nutrimix/views/providers/my_details_provider.dart';
import 'package:ciyone_nutrimix/views/providers/products_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cartProductsProvider = Provider<List<NewProductModel>>((ref) {
  final myDetails = ref.watch(myDetailsProvider).value;
  final allProducts = ref.watch(productsProvider).value ?? [];
  final List<CartModel> cart = myDetails == null ? [] : myDetails.cart;
  final List<NewProductModel> cartProducts = cart
      .map(
        (cartItem) => allProducts.firstWhere(
          (product) => cartItem.productId == product.id,
        ),
      )
      .toList();
  return cartProducts;
});
