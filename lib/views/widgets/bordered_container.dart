import 'package:ciyone_nutrimix/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class BorderedContainer extends StatelessWidget {
  const BorderedContainer({super.key, required this.child,this.width,this.height});
  final Widget child;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: AppColors.borderColor),
      ),
      padding: const EdgeInsets.all(15),
      child: child,
    );
  }
}
