import 'package:cached_network_image/cached_network_image.dart';
import 'package:ciyone_nutrimix/core/constants/app_colors.dart';
import 'package:ciyone_nutrimix/core/constants/app_icons.dart';
import 'package:ciyone_nutrimix/core/utils/app_navigator.dart';
import 'package:ciyone_nutrimix/core/utils/sized_box_extension.dart';
import 'package:ciyone_nutrimix/core/utils/theme_extension.dart';
import 'package:ciyone_nutrimix/models/product_model.dart';
import 'package:ciyone_nutrimix/views/product/product_detail_screen.dart';
import 'package:ciyone_nutrimix/views/widgets/custom_icon.dart';
import 'package:ciyone_nutrimix/views/widgets/heart_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class BuildProductDetails extends StatelessWidget {
  const BuildProductDetails({
    super.key,
    required this.product,
    this.icon = AppIcons.heart,
    this.showRating = true,
    this.varientIndex = 0,
    this.iconSize,
    this.onPressed,
  });
  final Product product;
  final String? icon;
  final bool showRating;
  final double? iconSize;
  final int varientIndex;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigator.push(ProductDetailScreen(product: product));
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl: product.varientImages[varientIndex].images[0],
            width: 90,
            height: 90,
            placeholder: (context, url) => const Center(
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(),
              ),
            ),
          ),
          10.w,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.title, style: context.bodyMedium),
                Text(
                  product.currentVarient.value,
                  style: context.bodySmall?.copyWith(
                    color: AppColors.secondaryTextColor,
                    height: 1.7,
                  ),
                ),
                8.h,
                Row(
                  children: [
                    Text(
                      '₹${product.pricing.price} ',
                      style: context.bodyLarge,
                    ),
                    if (product.pricing.discountPercentage > 0)
                      Text(
                        ' ₹${product.pricing.mrp} ',
                        style: context.bodyMedium?.copyWith(
                          color: AppColors.secondaryTextColor,
                          decoration: TextDecoration.lineThrough,
                          decorationColor: AppColors.secondaryTextColor,
                          decorationThickness: 2,
                        ),
                      ),
                    const Spacer(),
                    if (product.pricing.discountPercentage > 0)
                      Text(
                        'Save ₹${product.pricing.mrp - product.pricing.price}',
                        style: context.bodySmall?.copyWith(
                          color: AppColors.highlightTextColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    const Spacer(),
                  ],
                ),
                if (showRating)
                  Row(
                    children: [
                      Text(
                        '${product.rating.average}',
                        style: context.bodySmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      6.w,
                      RatingBar.builder(
                        initialRating: product.rating.average,
                        itemSize: 12,
                        allowHalfRating: true,
                        itemPadding: const EdgeInsetsGeometry.only(right: 5),
                        ignoreGestures: true,
                        itemBuilder: (context, index) {
                          return const CustomIcon(
                            AppIcons.starFilled,
                            color: AppColors.ratingColor,
                          );
                        },
                        onRatingUpdate: (rating) {},
                      ),
                      8.w,
                      if (product.rating.average > 4.4)
                        Expanded(
                          child: Text(
                            '(${product.rating.ratings} rating)',
                            style: context.bodySmall?.copyWith(fontSize: 8),
                          ),
                        ),
                    ],
                  ),
              ],
            ),
          ),
          5.w,
          if (icon == AppIcons.heart)
            HeartButton(productId: product.id)
          else if (icon != null)
            CustomIcon(
              icon!,
              color: AppColors.secondaryIconColor,
              size: iconSize ?? 16,
              onPressed: onPressed,
            ),
        ],
      ),
    );
  }
}
