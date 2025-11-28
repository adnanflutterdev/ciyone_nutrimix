import 'package:ciyone_nutrimix/core/constants/app_colors.dart';
import 'package:ciyone_nutrimix/core/constants/app_icons.dart';
import 'package:ciyone_nutrimix/core/utils/app_navigator.dart';
import 'package:ciyone_nutrimix/core/utils/sized_box_extension.dart';
import 'package:ciyone_nutrimix/core/utils/theme_extension.dart';
import 'package:ciyone_nutrimix/models/product_model.dart';
import 'package:ciyone_nutrimix/views/home/tabs/profile_tab/views/address/address_screen.dart';
import 'package:ciyone_nutrimix/views/home/tabs/profile_tab/views/order/cancel_order.dart';
import 'package:ciyone_nutrimix/views/home/tabs/profile_tab/views/order/customer_support.dart';
import 'package:ciyone_nutrimix/views/home/tabs/profile_tab/views/order/summary_details.dart';
import 'package:ciyone_nutrimix/views/widgets/buttons.dart';
import 'package:ciyone_nutrimix/views/widgets/custom_app_bar.dart';
import 'package:ciyone_nutrimix/views/widgets/custom_icon.dart';
import 'package:ciyone_nutrimix/views/widgets/custom_text_field.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    List<Map> labels = [
      {'title': 'Ordered', 'subtitle': 'Tue, 21 Feb 2023'},
      {
        'title': 'Packaged',
        'subtitle': 'We will notify you once your package is ready',
      },
      {'title': 'Shipped', 'subtitle': 'This process is not done yet'},
      {
        'title': 'Delivered',
        'subtitle': 'Expected delivery item sat, 25 feb 2023',
      },
    ];
    int stepperIndex = 0;
    return Scaffold(
      appBar: CustomAppBar(
        title: 'View Order Details',
        actions: [
           GestureDetector(
            onTap: () {
              AppNavigator.push(const CustomerSupport());
            },
            child: Row(
              children: [
                Text(
                  'Help',
                  style: context.titleSmall?.copyWith(
                    color: AppColors.secondaryTextColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                10.w,
                const CustomIcon(
                  AppIcons.ask,
                  size: 22,
                  color: AppColors.secondaryIconColor,
                ),
              ],
            ),
          ),
          15.w,
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.borderColor),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Column(
                    children: [
                      Container(
                        color: AppColors.borderColor,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Order ID',
                                    style: context.bodyLarge?.copyWith(
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    'Hka-48338-71309388',
                                    style: context.bodyLarge,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            Image.asset(product.image, height: 85),
                            20.w,
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.title,
                                    style: context.bodyMedium,
                                  ),
                                  Text(
                                    product.subTitle ?? '',
                                    style: context.bodySmall?.copyWith(
                                      color: AppColors.secondaryTextColor,
                                    ),
                                  ),
                                  10.h,
                                  Text(
                                    '₹${product.price}',
                                    style: context.titleSmall,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            30.h,
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: labels.length,
              itemBuilder: (context, index) {
                return _buildTrack(
                  context,
                  label: labels[index],
                  index: index,
                  stepperIndex: stepperIndex,
                );
              },
            ),
            30.h,
            Text('Payment By', style: context.bodyLarge),
            10.h,
            SummaryDetails(product: product),
            30.h,
            Row(
              children: [
                Text('Delivery Address', style: context.bodyLarge),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    AppNavigator.push(const AddressScreen());
                  },
                  child: Text(
                    'Change',
                    style: context.bodyMedium?.copyWith(
                      color: AppColors.highlightTextColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            10.h,
            const CustomTextField(
              readOnly: true,
              maxLines: 3,
              hintText:
                  'Ground floor, Teepeyem Enclave, Kaloor - Kadavanthara Rd, opp. Gokul Oottupura, Kochi, Kerala 682020',
            ),
            45.h,
            PrimaryButton(
              label: 'Cancel Order',
              onPressed: () {
                AppNavigator.push(const CancelOrder());
              },
              borderButton: true,
              borderRadius: 6,
              fontSize: 14,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTrack(
    BuildContext context, {
    required Map label,
    required int index,
    required int stepperIndex,
  }) {
    return Row(
      crossAxisAlignment: .start,
      children: [
        Column(
          children: [
            CustomIcon(
              index == stepperIndex
                  ? AppIcons.activeCircle
                  : AppIcons.untickCircle,
              size: 21,
              color: index == stepperIndex
                  ? AppColors.stepperActiveColor
                  : AppColors.secondaryIconColor,
            ),
            if (index != 3)
              const DottedLine(
                lineLength: 60,
                direction: Axis.vertical,
                dashColor: AppColors.secondaryIconColor,
              ),
          ],
        ),
        16.w,
        Expanded(
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Text(label['title'], style: context.titleSmall),
              Text(
                label['subtitle'],
                style: context.bodyLarge?.copyWith(
                  color: AppColors.secondaryTextColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
