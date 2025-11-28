import 'package:ciyone_nutrimix/core/constants/app_icons.dart';
import 'package:ciyone_nutrimix/core/utils/app_navigator.dart';
import 'package:ciyone_nutrimix/views/purchase/views/order_success_screen.dart';
import 'package:ciyone_nutrimix/views/purchase/views/payment_options/payment_options_drop_down.dart';
import 'package:ciyone_nutrimix/views/widgets/expand_toggler.dart';
import 'package:flutter/material.dart';

class NetBankingPayment extends StatefulWidget {
  const NetBankingPayment({super.key, required this.title});
  final String title;

  @override
  State<NetBankingPayment> createState() => _NetBankingPaymentState();
}

class _NetBankingPaymentState extends State<NetBankingPayment> {
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
                        title: 'Netbanking',
                        logo: 'assets/payment_icons/net_banking.png',
                        subtitle: '',
                        icon: AppIcons.arrowForward,
                        onTap: () {
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
