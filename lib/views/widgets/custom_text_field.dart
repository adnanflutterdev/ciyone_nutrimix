import 'package:ciyone_nutrimix/core/constants/app_colors.dart';
import 'package:ciyone_nutrimix/core/utils/theme_extension.dart';
import 'package:ciyone_nutrimix/core/constants/text_field_border.dart';
import 'package:ciyone_nutrimix/views/widgets/custom_icon.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hintText,
    this.maxLines,
    this.enabled = true,
    this.readOnly = false,
    this.suffixIcon,
    this.prefixIcon,
    this.controller,
    this.keyboardType,
    this.hintStyle,
    this.hint,
    this.onChanged
  });
  final String? hintText;
  final int? maxLines;
  final bool enabled;
  final bool readOnly;
  final CustomIcon? suffixIcon;
  final CustomIcon? prefixIcon;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final TextStyle? hintStyle;
  final Widget? hint;
  final Function(String value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: enabled,
      readOnly: readOnly,
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines ?? 1,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        prefixIcon: prefixIcon,
        prefixIconConstraints: const BoxConstraints(
          minWidth: 30,
          minHeight: 18,
        ),
        suffixIcon: suffixIcon,
        suffixIconConstraints: const BoxConstraints(
          minWidth: 30,
          minHeight: 18,
        ),
        hintText: hint == null ? hintText : null,
        hint: hint,
        hintStyle:
            hintStyle ??
            context.bodyLarge?.copyWith(
              color: AppColors.secondaryTextColor,
              fontWeight: FontWeight.normal,
            ),
        enabledBorder: border,
        focusedBorder: border,
        disabledBorder: border,
      ),

      onChanged: onChanged,
    );
  }
}
