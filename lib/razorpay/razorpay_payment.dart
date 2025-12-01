import 'package:ciyone_nutrimix/core/utils/app_navigator.dart';
import 'package:ciyone_nutrimix/models/address_model.dart';
import 'package:ciyone_nutrimix/models/cart_model.dart';
import 'package:ciyone_nutrimix/views/purchase/views/order_success_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class RazorpayPayment {
  final BuildContext context;
  final List<CartModel> cart;
  final AddressModel address;
  final bool wasFromCart;
  RazorpayPayment(this.context, {required this.cart, required this.address,required this.wasFromCart});
  late Razorpay _razorpay;

  void initPayment(BuildContext context, {required int amount}) {
    _razorpay = Razorpay();

    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);

    final options = {
      'key': 'rzp_test_Rl7kEXGGwCY9xG',
      'amount': amount * 100, // 1 rupee
      'currency': 'INR',
      'name': 'Test Payment',
      'description': 'Test Transaction',
      'timeout': 600, // optional
      'prefill': {'contact': address.number, 'email': address.emailId},
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      // print('Error: $e');
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // print('Payment Successful: ${response.paymentId}');
    AppNavigator.pushReplacement(
      OrderSuccessScreen(isCashOnDelivery: false, cart: cart, address: address,wasFromCart: wasFromCart,),
      pageAnimation: PageAnimation.fade,
    );
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    debugPrint('Payment Failed: ${response.message}');
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Payment failed'),
          content: Lottie.asset('assets/lottie/payment_failed.json'),
          actions: [
            TextButton(
              onPressed: () {
                AppNavigator.pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    debugPrint('External Wallet Selected');
  }

  void dispose() {
    _razorpay.clear();
  }
}
