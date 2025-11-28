import 'package:ciyone_nutrimix/core/constants/app_colors.dart';
import 'package:ciyone_nutrimix/core/utils/app_navigator.dart';
import 'package:ciyone_nutrimix/core/utils/sized_box_extension.dart';
import 'package:ciyone_nutrimix/core/utils/theme_extension.dart';
import 'package:ciyone_nutrimix/core/constants/text_field_border.dart';
import 'package:ciyone_nutrimix/views/purchase/views/order_success_screen.dart';
import 'package:ciyone_nutrimix/views/widgets/buttons.dart';
import 'package:ciyone_nutrimix/views/widgets/expand_toggler.dart';
import 'package:flutter/material.dart';

class UpiPayment extends StatefulWidget {
  const UpiPayment({super.key, required this.title});
  final String title;

  @override
  State<UpiPayment> createState() => _UpiPaymentState();
}

class _UpiPaymentState extends State<UpiPayment> {
  bool isStreached = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpandToggler(
          title: widget.title,
          onChanged: (value) {
            isStreached = value;
            setState(() {});
          },
        ),
        AnimatedSize(
          duration: const Duration(milliseconds: 300),
          child: isStreached
              ? Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Add a new UPI', style: context.bodyLarge),
                      Text(
                        'You need to have a registered upi id',
                        style: context.bodySmall?.copyWith(
                          color: AppColors.secondaryTextColor,
                        ),
                      ),
                      10.h,
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Enter your upi id',
                          hintStyle: context.bodyLarge?.copyWith(
                            color: AppColors.secondaryTextColor,
                            fontWeight: FontWeight.normal,
                          ),
                          contentPadding: const EdgeInsets.all(12),
                          focusedBorder: border,
                          enabledBorder: border,
                        ),
                      ),
                      8.h,
                      Center(
                        child: Text(
                          '(or)',
                          style: context.bodyMedium?.copyWith(
                            color: AppColors.secondaryTextColor,
                          ),
                        ),
                      ),
                      8.h,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/payment_icons/g_pay.png',
                            height: 22,
                          ),
                          4.w,
                          Text('Google pay', style: context.bodyLarge),
                        ],
                      ),
                      16.h,
                      PaymentButton(
                        label: 'Verify & Proceed',
                        onPressed: () {
                          AppNavigator.pushReplacement(
                            const OrderSuccessScreen(),
                            pageAnimation: PageAnimation.fade,
                          );
                        },
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
