import 'package:ciyone_nutrimix/core/constants/app_colors.dart';
import 'package:ciyone_nutrimix/core/constants/app_icons.dart';
import 'package:ciyone_nutrimix/core/utils/app_navigator.dart';
import 'package:ciyone_nutrimix/core/utils/sized_box_extension.dart';
import 'package:ciyone_nutrimix/core/utils/theme_extension.dart';
import 'package:ciyone_nutrimix/views/purchase/views/order_success_screen.dart';
import 'package:ciyone_nutrimix/views/purchase/views/payment_options/payment_options_drop_down.dart';
import 'package:ciyone_nutrimix/core/constants/text_field_border.dart';
import 'package:ciyone_nutrimix/views/widgets/buttons.dart';
import 'package:ciyone_nutrimix/views/widgets/custom_icon.dart';
import 'package:ciyone_nutrimix/views/widgets/expand_toggler.dart';
import 'package:flutter/material.dart';

class PayLaterPayment extends StatefulWidget {
  const PayLaterPayment({super.key, required this.title});
  final String title;

  @override
  State<PayLaterPayment> createState() => _PayLaterPaymentState();
}

class _PayLaterPaymentState extends State<PayLaterPayment> {
  bool isStreached = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpandToggler(
          value: widget.title,
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
                      const PayLaterOptions(
                        title: 'Lazy Pay',
                        logo: 'assets/payment_icons/lazy_pay.png',
                        primarySubtitle:
                            'Mobile number registered with lazypay',
                        secondarySubtitle:
                            'Your payment will fail if this number is not registered with lazypay.',
                      ),
                      15.h,
                      const PayLaterOptions(
                        title: 'ICICI Pay Later',
                        logo: 'assets/payment_icons/icici_pay.png',
                        primarySubtitle:
                            'Mobile number registered with lazypay',
                        secondarySubtitle:
                            'Your payment will fail if this number is not registered with ICICI pay later.',
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

class PayLaterOptions extends StatefulWidget {
  const PayLaterOptions({
    super.key,
    required this.title,
    required this.logo,
    required this.primarySubtitle,
    required this.secondarySubtitle,
  });
  final String title;
  final String logo;
  final String primarySubtitle;
  final String secondarySubtitle;

  @override
  State<PayLaterOptions> createState() => _PayLaterOptionsState();
}

class _PayLaterOptionsState extends State<PayLaterOptions> {
  bool isStreached = false;
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PaymentOptionsDropDown(
          title: widget.title,
          logo: widget.logo,
          subtitle: widget.primarySubtitle,
          onChanged: (value) {
            setState(() {
              isStreached = value;
            });
          },
        ),

        if (isStreached)
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: controller,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: 'Enter your mobile number',
                    hintStyle: context.bodyLarge?.copyWith(
                      color: AppColors.secondaryTextColor,
                      fontWeight: FontWeight.normal,
                    ),
                    contentPadding: const EdgeInsets.all(12),
                    focusedBorder: border,
                    enabledBorder: border,
                    suffixIcon: CustomIcon(
                      AppIcons.closeSquare,
                      horzontalPadding: 8,
                      onPressed: () {
                        controller.clear();
                      },
                    ),
                    suffixIconConstraints: const BoxConstraints(
                      minHeight: 32,
                      maxWidth: 32,
                    ),
                  ),
                ),
                10.h,
                Text(
                  widget.secondarySubtitle,
                  style: context.bodyMedium?.copyWith(
                    color: AppColors.secondaryTextColor,
                  ),
                ),
                10.h,
                PaymentButton(
                  label: 'Proceed',
                  onPressed: () {
                    AppNavigator.pushReplacement(
                      const OrderSuccessScreen(),
                      pageAnimation: PageAnimation.fade,
                    );
                  },
                ),
              ],
            ),
          ),
      ],
    );
  }
}
