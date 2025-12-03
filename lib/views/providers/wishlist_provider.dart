import 'package:ciyone_nutrimix/models/product_model.dart';
import 'package:ciyone_nutrimix/views/providers/my_details_provider.dart';
import 'package:ciyone_nutrimix/views/providers/products_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final wishlistProvider = Provider<List<Product>>((ref) {
  final myDetails = ref.watch(myDetailsProvider).value;
  final allProducts = ref.watch(productsProvider).value ?? [];
  final List<String> wishList = myDetails == null ? [] : myDetails.wishList;
  final List<Product> wishlistProducts = wishList
      .map(
        (productId) =>
            allProducts.firstWhere((product) => productId == product.id),
      )
      .toList();
  return wishlistProducts;
});
