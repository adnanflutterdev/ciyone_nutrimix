import 'package:ciyone_nutrimix/views/cart/build_address.dart';
import 'package:ciyone_nutrimix/views/cart/build_cart_item.dart';
import 'package:ciyone_nutrimix/views/cart/build_cart_summary.dart';
import 'package:flutter/material.dart';
import 'package:ciyone_nutrimix/views/widgets/custom_app_bar.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'My Cart'),
      body: Column(
        children: [
          BuildAddress(),
          Expanded(child: BuildCartItem()),
          BuildCartSummary(),
        ],
      ),
    );
  }
}
