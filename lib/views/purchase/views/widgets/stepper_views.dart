import 'package:flutter/widgets.dart';
import 'package:ciyone_nutrimix/models/cart_model.dart';
import 'package:ciyone_nutrimix/models/new_product_model.dart';
import 'package:ciyone_nutrimix/views/purchase/views/review.dart';
import 'package:ciyone_nutrimix/views/purchase/views/payment.dart';
import 'package:ciyone_nutrimix/views/purchase/views/address.dart';
import 'package:ciyone_nutrimix/views/purchase/views/place_order.dart';
import 'package:ciyone_nutrimix/core/global_notifier/quantity_notifier.dart';

List<Widget> stepperViews({required NewProductModel product}) => [
  Review(product: product),
  const Expanded(child: Address()),
  PlaceOrder(product: product),
  Payment(
    amount: product.pricing.price * quantity.value,
    cart: [CartModel(productId: product.id, quantity: quantity.value)],
  ),
];
