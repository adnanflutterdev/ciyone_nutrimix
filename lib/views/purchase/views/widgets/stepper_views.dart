import 'package:ciyone_nutrimix/core/global_notifier/quantity_notifier.dart';
import 'package:ciyone_nutrimix/models/new_product_model.dart';
import 'package:ciyone_nutrimix/views/purchase/views/address.dart';
import 'package:ciyone_nutrimix/views/purchase/views/place_order.dart';
import 'package:ciyone_nutrimix/views/purchase/views/review.dart';
import 'package:ciyone_nutrimix/views/purchase/views/payment.dart';
import 'package:flutter/widgets.dart';

List<TextEditingController> addressControllers = [
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
];

List<Widget> stepperViews({required NewProductModel product}) => [
  Review(product: product),
  Expanded(child: Address(addressControllers: addressControllers)),
  PlaceOrder(product: product),
  Payment(amount: product.pricing.price * quantity.value),
];
