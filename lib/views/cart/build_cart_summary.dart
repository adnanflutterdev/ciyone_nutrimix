import 'package:ciyone_nutrimix/core/constants/app_colors.dart';
import 'package:ciyone_nutrimix/core/utils/screen_size.dart';
import 'package:ciyone_nutrimix/core/utils/sized_box_extension.dart';
import 'package:ciyone_nutrimix/core/utils/theme_extension.dart';
import 'package:ciyone_nutrimix/models/cart_model.dart';
import 'package:ciyone_nutrimix/views/providers/cart_provider.dart';
import 'package:ciyone_nutrimix/views/providers/my_details_provider.dart';
import 'package:ciyone_nutrimix/views/widgets/build_delivery_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BuildCartSummary extends StatefulWidget {
  const BuildCartSummary({super.key});

  @override
  State<BuildCartSummary> createState() => _BuildCartSummaryState();
}

class _BuildCartSummaryState extends State<BuildCartSummary> {
  double containerHeight = 300;
  final double minHeight = 30;
  final double maxHeight = 400;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenSize.width,
      height: containerHeight,
      decoration: const BoxDecoration(
        color: AppColors.borderColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
        boxShadow: [BoxShadow(blurRadius: 5)],
      ),
      child: Column(
        children: [
          GestureDetector(
            onVerticalDragUpdate: (details) {
              setState(() {
                containerHeight = (containerHeight - details.delta.dy).clamp(
                  minHeight,
                  maxHeight,
                );
              });
            },
            child: Container(
              height: 30,
              color: Colors.transparent,
              child: Center(
                child: Container(
                  width: ScreenSize.width / 4,
                  height: 5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2.5),
                    color: AppColors.borderStrokeColor,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Consumer(
                builder: (context, ref, child) {
                  final myDetails = ref.watch(myDetailsProvider);
                  final cartProducts = ref.watch(cartProductsProvider);
                  return myDetails.when(
                    data: (data) {
                      List<CartModel> cart = data.cart;
                      int sumOfPrices = 0;
                      int sumOfDiscount = 0;
                      for (int x = 0; x < cartProducts.length; x++) {
                        sumOfPrices += cartProducts[x].pricing.price.toInt() * cart[x].quantity;
                        sumOfDiscount +=
                            (cartProducts[x].pricing.mrp - cartProducts[x].pricing.price).toInt() * cart[x].quantity;
                      }
                      return ListView(
                        children: [
                          buildDeliveryDetail(context),
                          20.h,
                          Row(
                            children: [
                              Text('Cart Summary', style: context.titleSmall),
                              Text(
                                ' (${cartProducts.length})',
                                style: context.bodyMedium,
                              ),
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
                                '₹${(sumOfPrices + sumOfDiscount)}',
                                style: context.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                          8.h,
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
                          8.h,
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
                                '-₹$sumOfDiscount',
                                style: context.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.normal,
                                  color: AppColors.success,
                                ),
                              ),
                            ],
                          ),
                          20.h,
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                color: AppColors.borderStrokeColor,
                              ),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  'Payable Amount',
                                  style: context.bodyLarge,
                                ),
                                const Spacer(),
                                Text(
                                  '₹$sumOfPrices',
                                  style: context.bodyLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                    error: (error, stackTrace) {
                      return const Center(
                        child: Text('Something went worng...'),
                      );
                    },
                    loading: () {
                      return const Center(child: CircularProgressIndicator());
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
