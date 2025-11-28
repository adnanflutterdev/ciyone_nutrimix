import 'package:ciyone_nutrimix/views/widgets/show_app_snackbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void toggleWishListItem(
  BuildContext context, {
  required String productId,
  required bool isInWishlist,
}) async {
  try {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({
          'wishlist': isInWishlist
              ? FieldValue.arrayRemove([productId])
              : FieldValue.arrayUnion([productId]),
        });
    if (!context.mounted) return;
    if (!isInWishlist) {
      showAppSnackbar(
        context: context,
        snackBarType: SnackBarType.success,
        message: 'Product Added To Your Wishlist ♥️',
      );
    }
  } on FirebaseAuthException catch (err) {
    showAppSnackbar(
        context: context,
        snackBarType: SnackBarType.success,
        message: err.message ?? 'Failed to add product in your wishlist',
      );
  }
}
