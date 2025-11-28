import 'package:ciyone_nutrimix/core/constants/app_colors.dart';
import 'package:ciyone_nutrimix/core/utils/sized_box_extension.dart';
import 'package:ciyone_nutrimix/core/utils/theme_extension.dart';
import 'package:ciyone_nutrimix/views/widgets/custom_icon.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.fontSize,
    this.isLoading,
    this.height = 50,
    this.borderRadius = 15,
    this.borderButton = false,
    this.padding,
    this.color = AppColors.primary,
  });
  final String label;
  final double height;
  final double? fontSize;
  final bool borderButton;
  final double borderRadius;
  final Function()? onPressed;
  final bool? isLoading;
  final Color color;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          color: borderButton ? null : color,
          borderRadius: BorderRadius.circular(borderRadius),
          border: borderButton ? Border.all(color: AppColors.primary) : null,
        ),
        child: Center(
          child: isLoading != null
              ? const SizedBox(
                  width: 30,
                  height: 30,
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: CircularProgressIndicator(color: AppColors.white),
                  ),
                )
              : Text(
                  label,
                  style: context.titleMedium?.copyWith(
                    fontSize: fontSize,
                    color: borderButton ? AppColors.primary : AppColors.white,
                  ),
                ),
        ),
      ),
    );
  }
}

class PaymentButton extends StatelessWidget {
  const PaymentButton({
    super.key,
    this.icon,
    this.onPressed,
    required this.label,
  });
  final String label;
  final String? icon;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 45,
        decoration: BoxDecoration(
          color: AppColors.stepperActiveColor,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) CustomIcon(icon!, color: AppColors.white),
            if (icon != null) 8.w,

            Text(
              label,
              style: context.bodyLarge?.copyWith(color: AppColors.white),
            ),
          ],
        ),
      ),
    );
  }
}
