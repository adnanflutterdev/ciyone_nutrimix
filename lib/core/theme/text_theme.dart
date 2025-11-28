import 'package:ciyone_nutrimix/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

TextTheme textTheme = const TextTheme(
  headlineLarge: TextStyle(
    fontFamily: 'Rubik',
    fontSize: 40,
    fontWeight: FontWeight.w900,
    height: 1.2,
    color: AppColors.titleTextColor,
  ),

  headlineMedium: TextStyle(
    fontFamily: 'Rubik',
    fontSize: 36,
    fontWeight: FontWeight.w900,
    color: AppColors.titleTextColor,
  ),

  titleLarge: TextStyle(
    fontFamily: 'Poppins',
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: AppColors.titleTextColor,
  ),
  // for buttons
  titleMedium: TextStyle(
    fontFamily: 'Poppins',
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryTextColor,
  ),

  titleSmall: TextStyle(
    fontFamily: 'Poppins',
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryTextColor,
  ),

  bodyLarge: TextStyle(
    fontFamily: 'Poppins',
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryTextColor,
  ),

  bodyMedium: TextStyle(
    fontFamily: 'Poppins',
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryTextColor,
  ),

  bodySmall: TextStyle(
    fontFamily: 'Poppins',
    fontSize: 10,
    color: AppColors.primaryTextColor,
  ),

  labelLarge: TextStyle(
    fontFamily: 'Poppins',
    fontSize: 14,
    color: AppColors.secondaryTextColor,
  ),
);
