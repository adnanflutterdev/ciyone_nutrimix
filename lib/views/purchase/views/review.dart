import 'package:ciyone_nutrimix/core/constants/app_colors.dart';
import 'package:ciyone_nutrimix/core/constants/app_icons.dart';
import 'package:ciyone_nutrimix/core/utils/sized_box_extension.dart';
import 'package:ciyone_nutrimix/core/utils/theme_extension.dart';
import 'package:ciyone_nutrimix/models/product_model.dart';
import 'package:ciyone_nutrimix/views/purchase/views/widgets/cart_item.dart';
import 'package:ciyone_nutrimix/core/global_notifier/quantity_notifier.dart';
import 'package:ciyone_nutrimix/views/widgets/build_delivery_details.dart';
import 'package:ciyone_nutrimix/views/widgets/custom_icon.dart';
import 'package:flutter/material.dart';

class Review extends StatelessWidget {
  const Review({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: ListView(
          children: [
            buildDeliveryDetail(context),
            25.h,
            CartItem(product: product),
            30.h,
            _buildApplyCoupons(context),
            20.h,
            _buildOrderSummary(context),
            20.h,
          ],
        ),
      ),
    );
  }

  Widget _buildApplyCoupons(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderColor),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          const CustomIcon(
            AppIcons.coupon,
            color: AppColors.highlightTextColor,
            size: 20,
          ),
          8.w,
          Text('Apply Coupons', style: context.bodyMedium),
          const Spacer(),
          const CustomIcon(AppIcons.arrowForward, size: 20),
        ],
      ),
    );
  }

  Widget _buildOrderSummary(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: quantity,
      builder: (context, value, child) {
        return Column(
          children: [
            Row(
              children: [
                Text('Order Summary', style: context.titleSmall),
                Text(' ($value item)', style: context.bodyMedium),
              ],
            ),
            20.h,
            Row(
              children: [
                Text(
                  'Total MRP',
                  style: context.bodyMedium?.copyWith(
                    color: AppColors.secondaryTextColor,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const Spacer(),
                Text(
                  '₹${value * (product.pricing.price)}',
                  style: context.bodyMedium?.copyWith(
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Shipping',
                  style: context.bodyMedium?.copyWith(
                    color: AppColors.secondaryTextColor,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const Spacer(),
                Text(
                  'Free',
                  style: context.bodyMedium?.copyWith(
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Charges',
                  style: context.bodyMedium?.copyWith(
                    color: AppColors.secondaryTextColor,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const Spacer(),
                Text(
                  '-',
                  style: context.bodyMedium?.copyWith(
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Total Discount',
                  style: context.bodyMedium?.copyWith(
                    color: AppColors.secondaryTextColor,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const Spacer(),
                Text(
                  '₹${value * (product.pricing.mrp - product.pricing.price)}',
                  style: context.bodyMedium?.copyWith(
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
            12.h,
            const Divider(),
            12.h,
            Row(
              children: [
                Text('Payable Amount', style: context.bodyLarge),
                const Spacer(),
                Text(
                  '₹${value * product.pricing.price}',
                  style: context.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
