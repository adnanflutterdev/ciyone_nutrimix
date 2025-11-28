import 'package:ciyone_nutrimix/core/constants/app_icons.dart';
import 'package:ciyone_nutrimix/core/utils/app_navigator.dart';
import 'package:ciyone_nutrimix/views/purchase/views/order_success_screen.dart';
import 'package:ciyone_nutrimix/views/purchase/views/payment_options/payment_options_drop_down.dart';
import 'package:ciyone_nutrimix/views/widgets/expand_toggler.dart';
import 'package:flutter/material.dart';

class AppsPayment extends StatefulWidget {
  const AppsPayment({super.key, required this.title});
  final String title;

  @override
  State<AppsPayment> createState() => _AppsPaymentState();
}

class _AppsPaymentState extends State<AppsPayment> {
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
                  child: PaymentOptionsDropDown(
                    title: 'Cred Pay',
                    logo: 'assets/payment_icons/cred_pay.png',
                    subtitle:
                        'Upto rs 500 cashback on your cred pay upi transaction',
                    icon: AppIcons.arrowForward,
                    onTap: () {
                      AppNavigator.pushReplacement(
                        const OrderSuccessScreen(),
                        pageAnimation: PageAnimation.fade,
                      );
                    },
                  ),
                )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}
