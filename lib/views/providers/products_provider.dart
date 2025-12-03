import 'package:ciyone_nutrimix/models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productsProvider = StreamProvider<List<Product>>((ref) {
  return FirebaseFirestore.instance.collection('products').snapshots().map((
    products,
  ) {
    return products.docs.map((product) {
      return Product.fromJson(product.data());
    }).toList();
  });
});
