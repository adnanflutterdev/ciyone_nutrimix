import 'package:ciyone_nutrimix/core/constants/app_colors.dart';
import 'package:ciyone_nutrimix/core/constants/app_icons.dart';
import 'package:ciyone_nutrimix/core/utils/app_navigator.dart';
import 'package:ciyone_nutrimix/core/utils/screen_size.dart';
import 'package:ciyone_nutrimix/core/utils/theme_extension.dart';
import 'package:ciyone_nutrimix/views/home/home_screen.dart';
import 'package:ciyone_nutrimix/views/home/tabs/profile_tab/views/order/orders_screen.dart';
import 'package:ciyone_nutrimix/views/widgets/custom_icon.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OrderSuccessScreen extends StatelessWidget {
  const OrderSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.now();
    int hrs = dateTime.hour > 12 ? dateTime.hour - 12 : dateTime.hour;
    int mins = dateTime.minute;
    List<String> shortMonthNames = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];

    String time =
        'On ${dateTime.day} ${shortMonthNames[dateTime.month]} ${hrs < 10 ? '0$hrs' : '$hrs'}:${mins < 10 ? '0$mins' : '$mins'} ${dateTime.hour >= 12 ? 'PM' : "AM"}';

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
                const Text('Your order is successful'),
                Text(time),
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
