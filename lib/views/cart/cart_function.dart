import 'package:ciyone_nutrimix/models/cart_model.dart';
import 'package:ciyone_nutrimix/views/widgets/show_app_snackbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<void> addToCart(BuildContext context, String productId) async {
  try {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({
          'cart': FieldValue.arrayUnion([
            CartModel(productId: productId, quantity: 1).toJson(),
          ]),
        });
    if (!context.mounted) return;

    showAppSnackbar(
      context: context,
      snackBarType: SnackBarType.success,
      message: 'Product added to cart...',
    );
  } on FirebaseException catch (err) {
    showAppSnackbar(
      context: context,
      message: err.message ?? 'Unknown error occured...',
      snackBarType: SnackBarType.error,
    );
  }
}

Future<void> updateQuantity(
  BuildContext context, {
  required List<CartModel> cart,
  required String productId,
  required int quantity,
}) async {
  try {
    int index = cart.indexWhere((element) => element.productId == productId);
    cart[index] = CartModel(productId: productId, quantity: quantity);
    List<Map<String, dynamic>> newCart = cart
        .map((cartItem) => cartItem.toJson())
        .toList();

    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({'cart': newCart});
  } on FirebaseException catch (err) {
    if (!context.mounted) return;
    showAppSnackbar(
      context: context,
      message: err.message ?? 'Unknown error occured...',
      snackBarType: SnackBarType.error,
    );
  }
}

Future<void> removeFromCart(
  BuildContext context, {
  required String productId,
  required int quantity,
}) async {
  try {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({
          'cart': FieldValue.arrayRemove([
            CartModel(productId: productId, quantity: quantity).toJson(),
          ]),
        });
  } on FirebaseException catch (err) {
    if (!context.mounted) return;
    showAppSnackbar(
      context: context,
      message: err.message ?? 'Unknown error occured...',
      snackBarType: SnackBarType.error,
    );
  }
}
