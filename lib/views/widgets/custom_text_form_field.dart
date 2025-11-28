import 'package:ciyone_nutrimix/core/constants/app_colors.dart';
import 'package:ciyone_nutrimix/core/utils/theme_extension.dart';
import 'package:flutter/material.dart';

enum FormValidator { email, password, confirmPassword, phone, name }

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.isObscure = false,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.formValidator,
    this.controller,
    this.password,
  }) : assert(
         formValidator != FormValidator.confirmPassword || password != null,
         'For confirming password "Password is required"',
       );
  final bool isObscure;
  final String hintText;

  final Widget? prefixIcon;
  final Widget? suffixIcon;

  final FormValidator? formValidator;
  final TextEditingController? controller;
  final String? password;

  @override
  Widget build(BuildContext context) {
    final keyboardType = switch (formValidator) {
      null => null,
      FormValidator.name => TextInputType.name,
      FormValidator.phone => TextInputType.phone,
      FormValidator.email => TextInputType.emailAddress,
      FormValidator.password => TextInputType.visiblePassword,
      FormValidator.confirmPassword => TextInputType.visiblePassword,
    };

    void formatMobileNumber(String value) {
      value = value.trim();
      if (value.length == 1 && value[0] != '+') {
        controller!.text = '+91 $value';
      } else if (value.length == 4) {
        controller!.text =
            "${value.substring(0, 3)} ${value[value.length - 1]}";
      } else if (value.length == 10) {
        controller!.text =
            "${value.substring(0, 9)} ${value[value.length - 1]}";
      } else if (value.length > 15) {
        controller!.text = value.substring(0, 15);
      } else {
        controller!.text = value;
      }
    }

    return TextFormField(
      obscureText: isObscure,
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: context.bodyLarge?.copyWith(
          color: AppColors.secondaryTextColor,
          fontWeight: FontWeight.normal,
        ),
      ),
      onChanged: formValidator == FormValidator.phone
          ? (value) => formatMobileNumber(value)
          : null,
      validator: (String? value) {
        final text = value?.trim() ?? '';

        switch (formValidator) {
          case null:
            return null;

          case FormValidator.email:
            if (text.isEmpty) return 'Email is required';
            if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(text)) {
              return 'Enter a valid email';
            }
            return null;

          case FormValidator.password:
            if (text.isEmpty) return 'Password is required';
            // if (!RegExp(
            //   r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#\$&*~]).{8,}$',
            // ).hasMatch(text)) {
            //   return 'Must contain 1 uppercase, 1 lowercase, 1 digit, 1 special char, and 8+ chars';
            // }
            if (text.trim().length < 6) {
              return 'Password length must be greater than 6';
            }
            return null;

          case FormValidator.phone:
            if (text.isEmpty) return 'Phone no is required';
            if (!RegExp(r'^\+\d{2}\s\d{5}\s\d{5}$').hasMatch(text)) {
              return 'Enter a valid phone number';
            }
            return null;

          case FormValidator.name:
            if (text.isEmpty) return 'Name is required';
            if (text.length < 3) return 'Name is too short';
            return null;

          case FormValidator.confirmPassword:
            if (text.isEmpty) return 'Confirm password';
            if (text != password) {
              return 'Password doesn\'t match';
            }
        }
        return null;
      },
    );
  }
}
