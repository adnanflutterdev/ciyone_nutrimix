import 'package:ciyone_nutrimix/dummy_data/products.dart';
import 'package:ciyone_nutrimix/models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> uploadProducts() async {
  final List<Product> allProducts = products;

  for (Product product in allProducts) {
    await FirebaseFirestore.instance
        .collection('products')
        .doc(product.id)
        .set(product.toJson());
    // print('Uploaded product: ${product.id}');
  }
}
