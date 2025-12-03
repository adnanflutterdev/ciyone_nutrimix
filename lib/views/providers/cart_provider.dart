import 'package:ciyone_nutrimix/models/cart_model.dart';
import 'package:ciyone_nutrimix/models/new_product_model.dart';
import 'package:ciyone_nutrimix/views/providers/products_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cartProvider = StreamProvider<List<CartModel>>((ref) {
  return FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('cart')
      .snapshots()
      .map(
        (cart) => cart.docs
            .map((cartItem) => CartModel.fromJson(cartItem.data()))
            .toList(),
      );
});

final cartProductsProvider = Provider<List<NewProductModel>>((ref) {
  final cart = ref.watch(cartProvider).value;
  final allProducts = ref.watch(productsProvider).value ?? [];
  final List<CartModel> myCart = cart ?? [];
  final List<NewProductModel> cartProducts = myCart
      .map(
        (cartItem) => allProducts.firstWhere(
          (product) => cartItem.productId == product.id,
        ),
      )
      .toList();
  return cartProducts;
});
