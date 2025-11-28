import 'package:ciyone_nutrimix/core/constants/app_colors.dart';
import 'package:ciyone_nutrimix/core/utils/app_navigator.dart';
import 'package:ciyone_nutrimix/core/utils/sized_box_extension.dart';
import 'package:ciyone_nutrimix/core/utils/theme_extension.dart';
import 'package:ciyone_nutrimix/views/purchase/views/order_success_screen.dart';
import 'package:ciyone_nutrimix/views/purchase/views/payment_options/payment_options_drop_down.dart';
import 'package:ciyone_nutrimix/views/widgets/buttons.dart';
import 'package:ciyone_nutrimix/views/widgets/expand_toggler.dart';
import 'package:flutter/material.dart';

class WalletsPayment extends StatefulWidget {
  const WalletsPayment({super.key, required this.title});
  final String title;

  @override
  State<WalletsPayment> createState() => _WalletsPaymentState();
}

class _WalletsPaymentState extends State<WalletsPayment> {
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
                      const WalletOptions(
                        title: 'Paytm & Paytm Postpaid',
                        logo: 'assets/payment_icons/paytm_wallet.png',
                        subtitle:
                            'Get upto rs.600 paytm cashback between made via Paytm & Paytm Postpaid. valid on min. order of rs.1200',
                      ),
                      15.h,
                      const WalletOptions(
                        title: 'Phonepe',
                        logo: 'assets/payment_icons/phone_pe_wallet.png',
                        subtitle:
                            'Get upto rs.600 phonepe cashback between made via phonepe wallet. valid on min. order of rs.1200',
                      ),
                      15.h,
                      const WalletOptions(
                        title: 'Mobikwik Wallet',
                        logo: 'assets/payment_icons/mobikwik_wallet.png',
                        subtitle:
                            'Get upto rs.600 mobikwik cashback between made via mobilkwik wallet. valid on min. order of rs.1200',
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

class WalletOptions extends StatefulWidget {
  const WalletOptions({
    super.key,
    required this.title,
    required this.logo,
    required this.subtitle,
  });
  final String title;
  final String logo;
  final String subtitle;

  @override
  State<WalletOptions> createState() => _WalletOptionsState();
}

class _WalletOptionsState extends State<WalletOptions> {
  bool isStreached = false;
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PaymentOptionsDropDown(
          title: widget.title,
          logo: widget.logo,
          subtitle: '',
          onChanged: (value) {
            setState(() {
              isStreached = value;
            });
          },
        ),

        if (isStreached)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                10.h,
                Text(
                  widget.subtitle,
                  style: context.bodyMedium?.copyWith(
                    color: AppColors.secondaryTextColor,
                  ),
                ),
                10.h,
                PaymentButton(label: 'Proceed', onPressed: () {
                      AppNavigator.pushReplacement(
                        const OrderSuccessScreen(),
                        pageAnimation: PageAnimation.fade,
                      );
                    },),
              ],
            ),
          ),
      ],
    );
  }
}
