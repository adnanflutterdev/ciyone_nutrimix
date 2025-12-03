import 'package:ciyone_nutrimix/core/constants/app_colors.dart';
import 'package:ciyone_nutrimix/core/utils/sized_box_extension.dart';
import 'package:ciyone_nutrimix/core/utils/theme_extension.dart';
import 'package:ciyone_nutrimix/models/new_product_model.dart';
import 'package:ciyone_nutrimix/views/widgets/expand_toggler.dart';
import 'package:flutter/material.dart';

class SummaryDetails extends StatefulWidget {
  const SummaryDetails({
    super.key,
    required this.products,
    required this.quantityList,
  });
  final List<NewProductModel> products;
  final List<int> quantityList;

  @override
  State<SummaryDetails> createState() => _SummaryDetailsState();
}

class _SummaryDetailsState extends State<SummaryDetails> {
  bool isExpaned = false;
  int quantity = 0;
  late List<NewProductModel> products;
  late List<int> quantityList;
  int sumOfPrices = 0;
  int sumOfDiscount = 0;

  @override
  void initState() {
    super.initState();
    products = widget.products;
    quantityList = widget.quantityList;
    for (int x = 0; x < products.length; x++) {
      sumOfPrices += products[x].pricing.price.toInt() * quantityList[x];
      sumOfDiscount +=
          (products[x].pricing.mrp - products[x].pricing.price).toInt() *
          quantityList[x];
    }
    for (int x in quantityList) {
      quantity += x;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpandToggler(
          value: '₹$sumOfPrices',
          onChanged: (value) {
            isExpaned = value;
            setState(() {});
          },
          title: 'Cash On Delivery ',
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
                          Text(
                            ' ($quantity item)',
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
                            '₹${sumOfPrices+sumOfDiscount}',
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
                            '-₹$sumOfDiscount',
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
                              '₹$sumOfPrices',
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
