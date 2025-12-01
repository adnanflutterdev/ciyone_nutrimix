import 'package:ciyone_nutrimix/core/constants/app_colors.dart';
import 'package:ciyone_nutrimix/core/utils/app_navigator.dart';
import 'package:ciyone_nutrimix/core/utils/theme_extension.dart';
import 'package:ciyone_nutrimix/models/address_model.dart';
import 'package:ciyone_nutrimix/models/cart_model.dart';
import 'package:ciyone_nutrimix/razorpay/razorpay_payment.dart';
import 'package:ciyone_nutrimix/views/providers/my_details_provider.dart';
import 'package:ciyone_nutrimix/views/purchase/views/order_success_screen.dart';
import 'package:ciyone_nutrimix/views/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

class Payment extends ConsumerWidget {
  const Payment({super.key, required this.amount, required this.cart, this.wasFromCart = false});
  final int amount;
  final List<CartModel> cart;
  final bool wasFromCart;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myDetails = ref.watch(myDetailsProvider);

    Future<bool> confirmationDialog() async {
      bool? result = await showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Confirm Purchase'),
            content: const Text('Are you sure to continue purchase'),
            actions: [
              TextButton(
                onPressed: () {
                  AppNavigator.pop(false);
                },
                child: const Text(
                  'Cancel',
                  style: TextStyle(color: AppColors.highlightTextColor),
                ),
              ),
              TextButton(
                onPressed: () {
                  AppNavigator.pop(true);
                },
                child: const Text('Confirm'),
              ),
            ],
          );
        },
      );
      return result ?? false;
    }

    return myDetails.when(
      data: (data) {
        AddressModel address = data.address[data.addressIndex];
        return Expanded(
          child: Column(
            children: [
              const Spacer(),
              Lottie.asset('assets/lottie/payment.json'),
              const Spacer(),
              PaymentButton(
                label: 'Go For Payment',
                onPressed: () {
                  RazorpayPayment razorpayPayment = RazorpayPayment(
                    context,
                    cart: cart,
                    address: address,
                    wasFromCart: wasFromCart
                  );
                  razorpayPayment.initPayment(context, amount: amount);
                },
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    const Expanded(child: Divider()),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'or',
                        style: context.bodyLarge?.copyWith(
                          color: AppColors.borderStrokeColor,
                        ),
                      ),
                    ),
                    const Expanded(child: Divider()),
                  ],
                ),
              ),
              PaymentButton(
                label: 'Cash On Delivery',
                onPressed: () async {
                  bool result = await confirmationDialog();
                  if (result) {
                    AppNavigator.pushReplacement(
                      OrderSuccessScreen(
                        isCashOnDelivery: true,
                        address: address,
                        cart: cart,
                        wasFromCart: wasFromCart,
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        );
      },
      error: (error, stackTrace) {
        return const Center(child: Text('Something went wrong...'));
      },
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}


/*
return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: ListView(
          children: [
            const UpiPayment(title: 'UPI payment'),
            15.h,
            const CardPayment(title: 'Debit/credit/saved card'),
            15.h,
            const AppsPayment(title: 'Pay with apps'),
            15.h,
            const SimplPayment(title: 'Simpl'),
            15.h,
            const PayLaterPayment(title: 'Pay Later'),
            15.h,
            const WalletsPayment(title: 'Wallets'),
            15.h,
            const NetBankingPayment(title: 'Internet Banking'),
            15.h,
            const CashOnDeliveryPayment(title: 'Cash On Delivery'),
          ],
        ),
      ),
    );
*/