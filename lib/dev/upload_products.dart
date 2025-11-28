import 'package:ciyone_nutrimix/dummy_data/new_products.dart';
import 'package:ciyone_nutrimix/models/new_product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> uploadProducts() async {
  final List<NewProductModel> allProducts = newProducts;

  for (NewProductModel product in allProducts) {
    await FirebaseFirestore.instance
        .collection('products')
        .doc(product.id)
        .set(product.toJson());
    // print('Uploaded product: ${product.id}');
  }
}
