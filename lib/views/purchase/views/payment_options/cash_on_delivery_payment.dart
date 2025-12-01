import 'package:ciyone_nutrimix/core/constants/app_icons.dart';
import 'package:ciyone_nutrimix/views/purchase/views/payment_options/payment_options_drop_down.dart';
import 'package:ciyone_nutrimix/views/widgets/expand_toggler.dart';
import 'package:flutter/material.dart';

class CashOnDeliveryPayment extends StatefulWidget {
  const CashOnDeliveryPayment({super.key, required this.title});
  final String title;

  @override
  State<CashOnDeliveryPayment> createState() => _CashOnDeliveryPaymentState();
}

class _CashOnDeliveryPaymentState extends State<CashOnDeliveryPayment> {
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
                      PaymentOptionsDropDown(
                        title: 'Cash On Delivery',
                        logo: 'assets/payment_icons/cash_on_delivery.png',
                        subtitle: '',
                        icon: AppIcons.arrowForward,
                        onTap: () {
                          // AppNavigator.pushReplacement(
                          //   const OrderSuccessScreen(),
                          //   pageAnimation: PageAnimation.fade,
                          // );
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
