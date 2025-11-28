import 'package:ciyone_nutrimix/core/constants/app_colors.dart';
import 'package:ciyone_nutrimix/core/utils/sized_box_extension.dart';
import 'package:ciyone_nutrimix/core/utils/theme_extension.dart';
import 'package:ciyone_nutrimix/models/product_model.dart';
import 'package:ciyone_nutrimix/views/widgets/expand_toggler.dart';
import 'package:flutter/material.dart';

class SummaryDetails extends StatefulWidget {
  const SummaryDetails({super.key, required this.product});
  final ProductModel product;

  @override
  State<SummaryDetails> createState() => _SummaryDetailsState();
}

class _SummaryDetailsState extends State<SummaryDetails> {
  bool isExpaned = false;

  final int value = 1;
  @override
  Widget build(BuildContext context) {
    ProductModel product = widget.product;
    return Column(
      children: [
        ExpandToggler(
          title: null,
          onChanged: (value) {
            isExpaned = value;
            setState(() {});
          },
          child: RichText(
            text: TextSpan(
              text: 'Cash On Delivery',
              style: context.bodyLarge?.copyWith(
                color: AppColors.secondaryTextColor,
                fontWeight: FontWeight.normal,
              ),
              children: [
                TextSpan(text: ' ₹${product.price}', style: context.bodyLarge),
              ],
            ),
          ),
        ),
        AnimatedSize(
          duration: const Duration(milliseconds: 300),
          child: isExpaned
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                            '₹${value * (product.price + product.discount)}',
                            style: context.bodyMedium?.copyWith(
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Shipping Charges',
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
                            'Total Discount',
                            style: context.bodyMedium?.copyWith(
                              color: AppColors.secondaryTextColor,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            '-₹${value * product.discount}',
                            style: context.bodyMedium?.copyWith(
                              fontWeight: FontWeight.normal,
                              color: AppColors.success,
                            ),
                          ),
                        ],
                      ),
                      12.h,
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(
                          color: AppColors.borderColor,
                        ),
                        child: Row(
                          children: [
                            Text('Payable Amount', style: context.bodyLarge),
                            const Spacer(),
                            Text(
                              '₹${value * product.price}',
                              style: context.bodyLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}
