import 'package:ciyone_nutrimix/core/constants/app_icons.dart';
import 'package:ciyone_nutrimix/core/constants/app_images.dart';
import 'package:ciyone_nutrimix/core/utils/app_navigator.dart';
import 'package:ciyone_nutrimix/core/utils/screen_size.dart';
import 'package:ciyone_nutrimix/core/utils/sized_box_extension.dart';
import 'package:ciyone_nutrimix/core/utils/theme_extension.dart';
import 'package:ciyone_nutrimix/views/auth/sign_in_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: ScreenSize.width,
            child: Image.asset(AppImages.welcomeScreenBg, fit: BoxFit.fitWidth),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, top: 25),
            child: Text('Welcome', style: context.headlineLarge),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15),
            child: Text(
              'Lorem ipsum dolor sit amet consectetur. Lorem id sit',
              style: context.labelLarge,
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('continue', style: context.labelLarge),
              15.w,
              GestureDetector(
                onTap: () {
                  AppNavigator.pushReplacement(
                    const SignInScreen(),
                    pageAnimation: PageAnimation.slideLToR,
                  );
                },
                child: Image.asset(AppIcons.continueArrow, width: 70),
              ),
              25.w,
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
