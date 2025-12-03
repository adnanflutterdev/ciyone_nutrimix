import 'package:ciyone_nutrimix/core/constants/app_colors.dart';
import 'package:ciyone_nutrimix/core/constants/app_icons.dart';
import 'package:ciyone_nutrimix/core/utils/app_navigator.dart';
import 'package:ciyone_nutrimix/core/utils/sized_box_extension.dart';
import 'package:ciyone_nutrimix/core/utils/theme_extension.dart';
import 'package:ciyone_nutrimix/models/new_product_model.dart';
import 'package:ciyone_nutrimix/views/cart/cart_screen.dart';
import 'package:ciyone_nutrimix/views/widgets/build_products.dart';
import 'package:ciyone_nutrimix/views/widgets/custom_icon.dart';
import 'package:flutter/material.dart';

class ViewAllProducts extends StatelessWidget {
  const ViewAllProducts({
    super.key,
    required this.title,
    required this.products,
  });
  final String title;
  final List<NewProductModel> products;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 40,
        leading: CustomIcon(
          AppIcons.arrowBack,
          onPressed: () => AppNavigator.pop(),
          horzontalPadding: 8,
        ),
        titleSpacing: 0,
        title: Row(
          children: [
            Text(
              title,
              style: context.titleSmall?.copyWith(fontFamily: 'PoppinsBold'),
            ),
            Expanded(
              child: Text(
                ' (${products.length} items)',
                style: context.bodyMedium,
              ),
            ),
          ],
        ),

        actions: [
          const CustomIcon(AppIcons.search, size: 22),
          20.w,
          CustomIcon(
            AppIcons.cart,
            size: 22,
            onPressed: () {
              AppNavigator.push(const CartScreen());
            },
          ),
          15.w,
        ],
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: AppColors.borderStrokeColor.withValues(alpha: 0.6),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsetsGeometry.all(15),
          child: BuildProducts(products: products),
        ),
      ),
    );
  }
}
