import 'package:ciyone_nutrimix/core/constants/app_colors.dart';
import 'package:ciyone_nutrimix/core/constants/app_icons.dart';
import 'package:ciyone_nutrimix/views/widgets/custom_icon.dart';
import 'package:flutter/material.dart';

class CarouselWireframe extends StatelessWidget {
  const CarouselWireframe({super.key});

  @override
  Widget build(BuildContext context) {
    final int currentIndex = 1;
    return Column(
      children: [
        const SizedBox(
          height: 200,
          child: Center(
            child: CustomIcon(
              AppIcons.gallery,
              size: 70,
              color: AppColors.secondaryIconColor,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(5, (index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: CustomIcon(
                currentIndex == index
                    ? AppIcons.filledCircle
                    : AppIcons.untickCircle,
                size: 8,
                color: AppColors.secondaryIconColor,
              ),
            );
          }),
        ),
      ],
    );
  }
}
