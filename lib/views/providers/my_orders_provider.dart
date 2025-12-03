import 'package:ciyone_nutrimix/models/new_product_model.dart';
import 'package:ciyone_nutrimix/models/order_model.dart';
import 'package:ciyone_nutrimix/views/providers/products_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final myOrdersProvider = StreamProvider<List<OrderModel>>((ref) {
  return FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('myOrders')
      .snapshots()
      .map(
        (orders) => orders.docs.reversed
            .map((order) => OrderModel.fromJson(order.data()))
            .toList(),
      );
});

final getOrderedProducts = Provider<List<List<NewProductModel>>>((ref) {
  final allProducts = ref.watch(productsProvider).value ?? [];
  final myOrders = ref.watch(myOrdersProvider).value ?? [];

  List<List<String>> productIds = myOrders
      .map((orders) => orders.cart.map((cart) => cart.productId).toList())
      .toList();

  return productIds
      .map(
        (listIds) => listIds
            .map((id) => allProducts.firstWhere((product) => id == product.id))
            .toList(),
      )
      .toList();
});
