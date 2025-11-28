import 'package:ciyone_nutrimix/core/constants/app_colors.dart';
import 'package:ciyone_nutrimix/core/theme/text_field_theme.dart';
import 'package:ciyone_nutrimix/core/theme/text_theme.dart';
import 'package:ciyone_nutrimix/core/utils/app_navigator.dart';
import 'package:ciyone_nutrimix/core/utils/screen_size.dart';
import 'package:ciyone_nutrimix/views/splash_screen.dart';
import 'package:flutter/material.dart';


class CiyoneNutrimix extends StatelessWidget {
  const CiyoneNutrimix({super.key});

  @override
  Widget build(BuildContext context) {

    // initializing ScreenSize
    ScreenSize.init(context);
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: const AppBarTheme(backgroundColor: AppColors.white),
        scaffoldBackgroundColor: AppColors.white,
        cardColor: AppColors.borderColor,
        inputDecorationTheme: inputDecoration,
        textTheme: textTheme,
        colorScheme: ColorScheme.fromSeed(
          surfaceTint: Colors.transparent,
          seedColor: AppColors.primary,
          primary: AppColors.primary,
          secondary: AppColors.highlightTextColor,
          error: AppColors.error,
        ),
        iconTheme: const IconThemeData(color: AppColors.primaryIconColor),
      ),
      navigatorKey: AppNavigator.navigatorKey,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      home: const SplashScreen(),
    );
  }
}
