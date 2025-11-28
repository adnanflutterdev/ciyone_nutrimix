import 'package:ciyone_nutrimix/models/new_product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productsProvider = StreamProvider<List<NewProductModel>>((ref) {
  return FirebaseFirestore.instance.collection('products').snapshots().map((
    products,
  ) {
    return products.docs.map((product) {
      return NewProductModel.fromJson(product.data());
    }).toList();
  });
});
