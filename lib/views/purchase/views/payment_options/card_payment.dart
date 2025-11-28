import 'package:ciyone_nutrimix/core/constants/app_icons.dart';
import 'package:ciyone_nutrimix/core/utils/app_navigator.dart';
import 'package:ciyone_nutrimix/views/purchase/views/order_success_screen.dart';
import 'package:ciyone_nutrimix/views/widgets/buttons.dart';
import 'package:ciyone_nutrimix/views/widgets/expand_toggler.dart';
import 'package:flutter/material.dart';

class CardPayment extends StatefulWidget {
  const CardPayment({super.key, required this.title});
  final String title;

  @override
  State<CardPayment> createState() => _UpiPaymentState();
}

class _UpiPaymentState extends State<CardPayment> {
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
                  child: PaymentButton(
                    label: 'Add New Card',
                    icon: AppIcons.addSquare,
                    onPressed: () {
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
