// import 'package:ciyone_nutrimix/core/utils/sized_box_extension.dart';
// import 'package:ciyone_nutrimix/views/purchase/views/payment_options/card_payment.dart';
// import 'package:ciyone_nutrimix/views/purchase/views/payment_options/apps_payment.dart';
// import 'package:ciyone_nutrimix/views/purchase/views/payment_options/cash_on_delivery_payment.dart';
// import 'package:ciyone_nutrimix/views/purchase/views/payment_options/net_banking_payment.dart';
// import 'package:ciyone_nutrimix/views/purchase/views/payment_options/pay_later_payment.dart';
// import 'package:ciyone_nutrimix/views/purchase/views/payment_options/simpl_payment.dart';
// import 'package:ciyone_nutrimix/views/purchase/views/payment_options/upi_payment.dart';
// import 'package:ciyone_nutrimix/views/purchase/views/payment_options/wallets_payment.dart';
import 'package:ciyone_nutrimix/razorpay/razorpay_payment.dart';
import 'package:ciyone_nutrimix/views/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Payment extends StatelessWidget {
  const Payment({super.key, required this.amount});
  final int amount;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const Spacer(),
          Lottie.asset('assets/lottie/payment.json',),
          const Spacer(),
          PaymentButton(
            label: 'Go For Payment',
            onPressed: () {
              RazorpayPayment razorpayPayment = RazorpayPayment(context);
              razorpayPayment.initPayment(context,amount: amount);
            },
          ),
        ],
      ),
    );
    // return Expanded(
    //   child: Padding(
    //     padding: const EdgeInsets.symmetric(vertical: 15.0),
    //     child: ListView(
    //       children: [
    //         const UpiPayment(title: 'UPI payment'),
    //         15.h,
    //         const CardPayment(title: 'Debit/credit/saved card'),
    //         15.h,
    //         const AppsPayment(title: 'Pay with apps'),
    //         15.h,
    //         const SimplPayment(title: 'Simpl'),
    //         15.h,
    //         const PayLaterPayment(title: 'Pay Later'),
    //         15.h,
    //         const WalletsPayment(title: 'Wallets'),
    //         15.h,
    //         const NetBankingPayment(title: 'Internet Banking'),
    //         15.h,
    //         const CashOnDeliveryPayment(title: 'Cash On Delivery'),
    //       ],
    //     ),
    //   ),
    // );
  }
}
