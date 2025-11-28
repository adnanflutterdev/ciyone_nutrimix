import 'package:ciyone_nutrimix/core/constants/app_colors.dart';
import 'package:ciyone_nutrimix/core/utils/sized_box_extension.dart';
import 'package:ciyone_nutrimix/core/utils/theme_extension.dart';
import 'package:ciyone_nutrimix/views/product/view_all_products.dart';
import 'package:ciyone_nutrimix/views/providers/wishlist_provider.dart';
import 'package:ciyone_nutrimix/views/widgets/build_product_row.dart';
import 'package:ciyone_nutrimix/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WishListScreen extends ConsumerWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myWishList = ref.watch(wishlistProvider);
    if (myWishList.isEmpty) {
      return Scaffold(
        appBar: const CustomAppBar(title: 'My Wishlist'),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              30.h,
              Center(child: Image.asset('assets/bg/empty.png', height: 180)),
              20.h,
              Text(
                'Your wishlist is empty. browse some products and wishlist them now.',
                style: context.bodyLarge?.copyWith(
                  color: AppColors.secondaryTextColor,
                ),
                textAlign: TextAlign.center,
              ),
              30.h,
              const BuildProductRow(title: 'Trending Products'),
            ],
          ),
        ),
      );
    }
    return ViewAllProducts(title: 'My Wishlist', products: myWishList);
  }
}
