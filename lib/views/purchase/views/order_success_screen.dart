import 'package:ciyone_nutrimix/core/constants/app_colors.dart';
import 'package:ciyone_nutrimix/core/constants/app_icons.dart';
import 'package:ciyone_nutrimix/core/global_notifier/quantity_notifier.dart';
import 'package:ciyone_nutrimix/core/utils/app_navigator.dart';
import 'package:ciyone_nutrimix/core/utils/get_time.dart';
import 'package:ciyone_nutrimix/core/utils/screen_size.dart';
import 'package:ciyone_nutrimix/core/utils/theme_extension.dart';
import 'package:ciyone_nutrimix/models/address_model.dart';
import 'package:ciyone_nutrimix/models/cart_model.dart';
import 'package:ciyone_nutrimix/models/order_model.dart';
import 'package:ciyone_nutrimix/views/home/home_screen.dart';
import 'package:ciyone_nutrimix/views/home/tabs/profile_tab/views/order/orders_screen.dart';
import 'package:ciyone_nutrimix/views/widgets/custom_icon.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:uuid/uuid.dart';

class OrderSuccessScreen extends StatelessWidget {
  const OrderSuccessScreen({
    super.key,
    required this.cart,
    required this.isCashOnDelivery,
    required this.address,
    required this.wasFromCart,
  });
  final List<CartModel> cart;
  final bool isCashOnDelivery;
  final AddressModel address;
  final bool wasFromCart;

  @override
  Widget build(BuildContext context) {
    String time = getCurrentDateTime();

    void updateOrders() async {
      OrderModel orderModel = OrderModel(
        id: const Uuid().v4(),
        carts: cart,
        orderStatus: OrderStatus(
          orderDate: time,
          packaged: false,
          shipped: false,
          deliveryDate: getDateTimeAfter(3),
          delivered: false,
          cancelled: false,
        ),
        paymentMethod: isCashOnDelivery ? 'Cash on Delivery' : 'Razorpay',
        address: address,
      );
      quantity.value = 1;

      print(orderModel.toJson());
      DocumentReference ref = FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid);
      await ref
          .collection('myOrders')
          .doc('${Timestamp.now().microsecondsSinceEpoch}')
          .set(orderModel.toJson());
      if (wasFromCart) {
        ref.update({'cart': []});
      }
    }

    updateOrders();

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 40,
        leading: CustomIcon(
          AppIcons.arrowBack,
          onPressed: () => AppNavigator.pop(),
          horzontalPadding: 8,
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: AppColors.borderStrokeColor.withValues(alpha: 0.6),
          ),
        ),
      ),
      body: Stack(
        children: [
          Lottie.asset('assets/lottie/coffetti.json', repeat: false),
          Transform.flip(
            flipX: true,
            child: Lottie.asset('assets/lottie/coffetti.json', repeat: false),
          ),
          // Transform(
          //   transform: Matrix4.identity()..rotateZ(90),
          //   child: Lottie.asset('assets/lottie/coffetti.json', repeat: true),
          // ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 150,
                  child: Lottie.asset(
                    'assets/lottie/payment_success.json',
                    fit: BoxFit.fitHeight,
                    repeat: false,
                  ),
                ),
                const Text('Your order is placed successfully'),
                Text('On  $time'),
              ],
            ),
          ),
        ],
      ),
      // Bottom Buttons
      bottomNavigationBar: SafeArea(
        child: Container(
          height: 60,
          decoration: const BoxDecoration(
            border: Border(top: BorderSide(color: AppColors.borderStrokeColor)),
          ),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  AppNavigator.pushReplacement(const OrdersScreen());
                },
                child: SizedBox(
                  width: ScreenSize.width / 2,
                  child: Center(
                    child: Text(
                      'Go to my orders',
                      style: context.bodyLarge?.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  AppNavigator.pushAndRemoveUntil(
                    const HomeScreen(),
                    pageAnimation: PageAnimation.fade,
                  );
                },
                child: Container(
                  color: AppColors.primary,
                  width: ScreenSize.width / 2,
                  child: Center(
                    child: Text(
                      'Go to home',
                      style: context.bodyLarge?.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
