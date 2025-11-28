import 'package:ciyone_nutrimix/core/constants/app_colors.dart';
import 'package:ciyone_nutrimix/core/constants/app_icons.dart';
import 'package:ciyone_nutrimix/core/utils/app_navigator.dart';
import 'package:ciyone_nutrimix/core/utils/sized_box_extension.dart';
import 'package:ciyone_nutrimix/core/utils/theme_extension.dart';
import 'package:ciyone_nutrimix/views/home/tabs/profile_tab/views/order/customer_support.dart';
import 'package:ciyone_nutrimix/views/widgets/buttons.dart';
import 'package:ciyone_nutrimix/views/widgets/custom_app_bar.dart';
import 'package:ciyone_nutrimix/views/widgets/custom_icon.dart';
import 'package:ciyone_nutrimix/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class CancelOrder extends StatefulWidget {
  const CancelOrder({super.key});

  @override
  State<CancelOrder> createState() => _CancelOrderState();
}

class _CancelOrderState extends State<CancelOrder> {
  List<String> reasons = [
    'Product change',
    'Quantity change',
    'I do not require the product anymore',
    'Ordered by mistake',
    'Will place a new order',
    'Delivery promise did not meet expectation',
    'Others',
  ];
  int selectedIndex = 6;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Cancel Order',
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
            Text(
              'Reason For Cancellation',
              style: context.titleSmall?.copyWith(fontFamily: 'PoppinsBold'),
            ),
            6.h,
            Text(
              'Please tell us correct reason for cancellation this information is only used to improve our services',
              style: context.bodyLarge?.copyWith(
                color: AppColors.secondaryTextColor,
              ),
            ),
            15.h,
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    selectedIndex = index;
                    setState(() {});
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Row(
                        children: [
                          CustomIcon(
                            size: 18,
                            selectedIndex == index
                                ? AppIcons.activeCircle
                                : AppIcons.untickCircle,
                            color: selectedIndex == index
                                ? AppColors.stepperActiveColor
                                : AppColors.secondaryIconColor,
                          ),
                          12.w,
                          Expanded(
                            child: Text(
                              reasons[index],
                              style: context.titleSmall,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: reasons.length,
            ),
            if (selectedIndex == 6)
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: CustomTextField(
                  maxLines: 4,
                  hintText: 'Write your comments',
                ),
              ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: PrimaryButton(
          label: 'Cancel Order',
          onPressed: () {
            AppNavigator.pop();
          },
          fontSize: 14,
          borderRadius: 0,
        ),
      ),
    );
  }
}
