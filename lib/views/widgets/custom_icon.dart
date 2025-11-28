import 'package:ciyone_nutrimix/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon(
    this.icon, {
    super.key,
    this.size = 16,
    this.color,
    this.onPressed,
    this.onTapDown,
    this.horzontalPadding = 0,
    this.verticalPadding = 0,
  });

  final String icon;
  final double size;
  final Color? color;
  final double horzontalPadding;
  final double verticalPadding;
  final Function()? onPressed;
  final ValueChanged<TapDownDetails>? onTapDown;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      onTapDown:onTapDown,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horzontalPadding,
          vertical: verticalPadding,
        ),
        child: SvgPicture.asset(
          icon,
          width: size,
          height: size,
          colorFilter: ColorFilter.mode(
            color ?? AppColors.primaryIconColor,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
