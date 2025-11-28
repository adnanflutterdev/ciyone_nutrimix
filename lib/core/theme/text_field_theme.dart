import 'package:ciyone_nutrimix/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

InputDecorationTheme inputDecoration = InputDecorationTheme(
  prefixIconConstraints: const BoxConstraints(maxWidth: 30, maxHeight: 20),
  suffixIconConstraints: const BoxConstraints(maxWidth: 30, maxHeight: 20),
  hintStyle: const TextStyle(color: AppColors.hintTextColor),
  prefixStyle: const TextStyle(color: AppColors.hintTextColor),
  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
  enabledBorder: inputBorder(),
  focusedBorder: inputBorder(color: AppColors.primary, width: 3),
  errorBorder: inputBorder(color: AppColors.error),
  focusedErrorBorder: inputBorder(color: AppColors.primary, width: 3),
);

UnderlineInputBorder inputBorder({
  Color color = AppColors.primaryLight,
  double width = 2,
}) {
  return UnderlineInputBorder(
    borderSide: BorderSide(color: color, width: width),
  );
}
