import 'package:ciyone_nutrimix/core/constants/app_colors.dart';
import 'package:ciyone_nutrimix/core/utils/app_navigator.dart';
import 'package:ciyone_nutrimix/core/utils/theme_extension.dart';
import 'package:ciyone_nutrimix/models/product_model.dart';
import 'package:ciyone_nutrimix/views/product/product_detail_screen.dart';
import 'package:ciyone_nutrimix/views/widgets/build_product_details.dart';
import 'package:flutter/material.dart';

class BuildProducts extends StatelessWidget {
  const BuildProducts({
    super.key,
    required this.products,
    this.shrinkWrap = false,
  });
  final List<Product> products;
  final bool shrinkWrap;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      shrinkWrap: shrinkWrap,
      physics: shrinkWrap ? const NeverScrollableScrollPhysics() : null,
      itemBuilder: (context, index) {
        Product product = products[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: Stack(
            children: [
              GestureDetector(
                onTap: () {
                  AppNavigator.push(ProductDetailScreen(product: product));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: AppColors.borderColor),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 20.0,
                    ),
                    child: BuildProductDetails(product: product),
                  ),
                ),
              ),
              if (product.rating.ratings > 200)
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: const BoxDecoration(
                      color: AppColors.chipColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(6),
                        bottomRight: Radius.circular(6),
                      ),
                    ),
                    child: Text(
                      'Bestseller',
                      style: context.bodySmall?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
