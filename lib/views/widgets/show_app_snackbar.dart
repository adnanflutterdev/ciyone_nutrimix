import 'package:ciyone_nutrimix/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

enum SnackBarType { normal, success, error }

void showAppSnackbar({
  required BuildContext context,
  required String message,
  SnackBarType snackBarType = SnackBarType.normal,
}) {
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(
    snackBarType == SnackBarType.normal
        ? SnackBar(
            showCloseIcon: true,
            behavior: SnackBarBehavior.floating,
            backgroundColor: AppColors.borderStrokeColor,
            content: Text(message),
          )
        : snackBarType == SnackBarType.success
        ? SnackBar(
            showCloseIcon: true,
            behavior: SnackBarBehavior.floating,
            backgroundColor: AppColors.success,
            content: Text(message),
          )
        : SnackBar(
            showCloseIcon: true,
            behavior: SnackBarBehavior.floating,
            backgroundColor: AppColors.error,
            content: Text(message),
          ),
  );
}
