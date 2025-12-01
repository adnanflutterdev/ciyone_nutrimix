import 'package:ciyone_nutrimix/core/constants/app_icons.dart';
import 'package:ciyone_nutrimix/views/purchase/views/payment_options/payment_options_drop_down.dart';
import 'package:ciyone_nutrimix/views/widgets/expand_toggler.dart';
import 'package:flutter/material.dart';

class SimplPayment extends StatefulWidget {
  const SimplPayment({super.key, required this.title});
  final String title;

  @override
  State<SimplPayment> createState() => _SimplPaymentState();
}

class _SimplPaymentState extends State<SimplPayment> {
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
                    title: 'Simpl',
                    logo: 'assets/payment_icons/simpl.png',
                    subtitle:
                        'Pay using simpl on healthkart and get 5% cashback up to rs.500',
                    icon: AppIcons.arrowForward,
                    onTap: () {
                      // AppNavigator.pushReplacement(
                      //   const OrderSuccessScreen(),
                      //   pageAnimation: PageAnimation.fade,
                      // );
                    },
                  ),
                )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}
