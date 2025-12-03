import 'package:ciyone_nutrimix/models/cart_model.dart';
import 'package:ciyone_nutrimix/views/widgets/show_app_snackbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<void> addToCart(
  BuildContext context, {
  required String productId,
  required int varientIndex,
}) async {
  try {
    final docId = DateTime.now().millisecondsSinceEpoch;
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('cart')
        .doc('$docId')
        .set(
          CartModel(
            docId: '$docId',
            productId: productId,
            quantity: 1,
            varientIndex: varientIndex,
          ).toJson(),
        );
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
  required String docId,
  required int quantity,
}) async {
  try {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('cart')
        .doc(docId)
        .update({'quantity': quantity});
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
  required String docId,
}) async {
  try {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('cart')
        .doc(docId)
        .delete();
  } on FirebaseException catch (err) {
    if (!context.mounted) return;
    showAppSnackbar(
      context: context,
      message: err.message ?? 'Unknown error occured...',
      snackBarType: SnackBarType.error,
    );
  }
}
