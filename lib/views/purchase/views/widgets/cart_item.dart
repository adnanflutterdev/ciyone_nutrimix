import 'package:ciyone_nutrimix/core/constants/app_colors.dart';
import 'package:ciyone_nutrimix/core/constants/app_icons.dart';
import 'package:ciyone_nutrimix/core/utils/sized_box_extension.dart';
import 'package:ciyone_nutrimix/core/utils/theme_extension.dart';
import 'package:ciyone_nutrimix/models/new_product_model.dart';
import 'package:ciyone_nutrimix/core/global_notifier/quantity_notifier.dart';
import 'package:ciyone_nutrimix/views/widgets/custom_icon.dart';
import 'package:ciyone_nutrimix/views/widgets/build_product_details.dart';
import 'package:flutter/material.dart';

class CartItem extends StatefulWidget {
  const CartItem({super.key, required this.product});

  final NewProductModel product;
  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  // int quantity = 1;
  @override
  Widget build(BuildContext context) {
    if (quantity.value <= 0) {
      return Container();
    }
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderColor),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: BuildProductDetails(
              product: widget.product,
              showRating: false,
              icon: AppIcons.closeSquareOutlined,
              onPressed: () {
                quantity.value = 0;
              },
            ),
          ),
          15.h,
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                CustomIcon(
                  AppIcons.minusSquare,
                  size: 18,
                  horzontalPadding: 8,
                  verticalPadding: 4,
                  onPressed: () {
                    if (quantity.value > 0) {
                      quantity.value--;
                    }
                  },
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.borderColor,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: ValueListenableBuilder(
                    valueListenable: quantity,
                    builder: (context, value, child) {
                      return Text('$value');
                    },
                  ),
                ),
                CustomIcon(
                  AppIcons.addSquare,
                  size: 18,
                  horzontalPadding: 8,
                  verticalPadding: 4,
                  onPressed: () {
                    quantity.value++;
                  },
                ),
              ],
            ),
          ),
          20.h,
          Container(
            height: 36,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: AppColors.stepperActiveColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(6),
                bottomRight: Radius.circular(6),
              ),
            ),
            child: Center(
              child: Text(
                'You are saving ₹${widget.product.pricing.mrp - widget.product.pricing.price} on this purchase',
                style: context.bodyMedium?.copyWith(color: AppColors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
