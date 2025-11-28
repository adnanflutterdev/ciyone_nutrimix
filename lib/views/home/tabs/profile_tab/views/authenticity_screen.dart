import 'package:ciyone_nutrimix/core/constants/app_colors.dart';
import 'package:ciyone_nutrimix/core/constants/app_icons.dart';
import 'package:ciyone_nutrimix/core/utils/app_navigator.dart';
import 'package:ciyone_nutrimix/core/utils/sized_box_extension.dart';
import 'package:ciyone_nutrimix/core/utils/theme_extension.dart';
import 'package:ciyone_nutrimix/views/widgets/custom_icon.dart';
import 'package:flutter/material.dart';

class AuthenticityScreen extends StatelessWidget {
  const AuthenticityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 40,
        leading: CustomIcon(
          AppIcons.arrowBack,
          onPressed: () => AppNavigator.pop(),
          horzontalPadding: 8,
        ),
        titleSpacing: 0,
        title: Text(
          'Authenticity',
          style: context.titleSmall?.copyWith(fontFamily: 'PoppinsBold'),
        ),

        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: AppColors.borderStrokeColor.withValues(alpha: 0.6),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            30.h,
            Center(child: Image.asset('assets/bg/empty.png', height: 180)),
            20.h,
            Text(
              'Authenticity Delivered',
              style: context.titleMedium?.copyWith(fontSize: 20),
            ),
            20.h,
            Text(
              'About half of the supplements sold in india are suspect - they are either parallel imports or fake. supplements may contain banned substances, such as steroids, which may cause permanent damage to you body.',
              style: context.bodyLarge?.copyWith(
                color: AppColors.secondaryTextColor,
              ),
              textAlign: TextAlign.center,
            ),
            30.h,
            TextButton.icon(
              onPressed: () {},
              icon: const CustomIcon(
                AppIcons.arrowCircleRight,
                color: AppColors.primary,
              ),
              style: TextButton.styleFrom(),
              iconAlignment: IconAlignment.end,
              label: Text(
                'View All ',
                style: context.bodyLarge?.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
