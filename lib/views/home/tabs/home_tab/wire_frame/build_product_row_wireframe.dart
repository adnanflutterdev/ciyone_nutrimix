import 'package:ciyone_nutrimix/dummy_data/products.dart';
import 'package:ciyone_nutrimix/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:ciyone_nutrimix/views/widgets/buttons.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ciyone_nutrimix/core/constants/app_icons.dart';
import 'package:ciyone_nutrimix/core/constants/app_colors.dart';
import 'package:ciyone_nutrimix/views/widgets/custom_icon.dart';
import 'package:ciyone_nutrimix/core/utils/theme_extension.dart';
import 'package:ciyone_nutrimix/core/utils/sized_box_extension.dart';

class BuildProductRowWireframe extends StatelessWidget {
  const BuildProductRowWireframe({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('title', style: context.titleSmall),
            const Spacer(),
            TextButton.icon(
              onPressed: () {},
              icon: const CustomIcon(
                AppIcons.arrowCircleRight,
                color: AppColors.secondaryIconColor,
              ),
              style: TextButton.styleFrom(),
              iconAlignment: IconAlignment.end,
              label: Text(
                'View All ',
                style: context.bodyLarge?.copyWith(
                  color: AppColors.secondaryTextColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 275,
          child: ListView.builder(
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              Product product = newProducts[index];
              final off = product.pricing.discountPercentage;
              return Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: Container(
                  width: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: AppColors.borderColor),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Align(
                          alignment: Alignment.centerRight,
                          child: CustomIcon(
                            AppIcons.heart,
                            color: AppColors.secondaryIconColor,
                          ),
                        ),
                        const Spacer(flex: 2),
                        const Center(
                          child: CustomIcon(
                            AppIcons.gallery,
                            size: 60,
                            color: AppColors.secondaryIconColor,
                          ),
                        ),
                        const Spacer(flex: 2),
                        Text(
                          product.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: context.bodyMedium,
                        ),
                        const Spacer(flex: 1),
                        Row(
                          children: [
                            Text(
                              '₹${product.pricing.price} ',
                              style: context.bodyLarge,
                            ),
                            Text(
                              ' ₹${product.pricing.mrp}',
                              style: context.bodyMedium?.copyWith(
                                color: AppColors.secondaryTextColor,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              '$off% off',
                              style: context.bodySmall?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                        const Spacer(flex: 1),
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
                              itemPadding: const EdgeInsetsGeometry.only(
                                right: 5,
                              ),
                              ignoreGestures: true,
                              itemBuilder: (context, index) {
                                return const CustomIcon(AppIcons.starFilled);
                              },
                              onRatingUpdate: (rating) {},
                            ),
                          ],
                        ),
                        const Spacer(flex: 2),
                        PrimaryButton(
                          label: 'Add To Cart',
                          onPressed: () {},
                          fontSize: 14,
                          height: 32,
                          borderRadius: 6,
                          color: AppColors.primaryIconColor,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
