import 'package:ciyone_nutrimix/models/cart_model.dart';
import 'package:ciyone_nutrimix/views/purchase/views/payment.dart';
import 'package:ciyone_nutrimix/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key, required this.amount, required this.cart});
  final int amount;
  final List<CartModel> cart;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Checkout'),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(children: [Payment(amount: amount, cart: cart,wasFromCart: true,)]),
      ),
    );
  }
}
