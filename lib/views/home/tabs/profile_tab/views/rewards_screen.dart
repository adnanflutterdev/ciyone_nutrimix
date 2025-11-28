import 'package:ciyone_nutrimix/core/constants/app_colors.dart';
import 'package:ciyone_nutrimix/core/constants/app_icons.dart';
import 'package:ciyone_nutrimix/core/utils/app_navigator.dart';
import 'package:ciyone_nutrimix/core/utils/sized_box_extension.dart';
import 'package:ciyone_nutrimix/core/utils/theme_extension.dart';
import 'package:ciyone_nutrimix/views/widgets/buttons.dart';
import 'package:ciyone_nutrimix/views/widgets/custom_icon.dart';
import 'package:ciyone_nutrimix/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class RewardsScreen extends StatelessWidget {
  const RewardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map> icons = [
      {'label': 'Earned', 'icon': AppIcons.earned},
      {'label': 'Spent', 'icon': AppIcons.spent},
    ];
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
          'Rewards',
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
          crossAxisAlignment: .start,
          children: [
            20.h,
            Center(
              child: Text(
                '0\nHK cash coins balance',
                style: context.titleSmall?.copyWith(
                  color: AppColors.secondaryTextColor,
                ),
                textAlign: .center,
              ),
            ),
            30.h,
            Row(
              mainAxisAlignment: .spaceEvenly,
              children: icons
                  .map(
                    (icon) => Container(
                      padding: const .symmetric(horizontal: 35, vertical: 25),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.borderColor),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.borderColor,
                            ),
                            child: CustomIcon(
                              icon['icon'],
                              size: 40,
                              color: AppColors.secondaryIconColor,
                            ),
                          ),
                          20.h,
                          Text(icon['label'], style: context.titleSmall),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
            30.h,
            Text('Redeem Coupon', style: context.bodyLarge),
            10.h,
            const CustomTextField(hintText: 'Enter Coupon number'),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: PrimaryButton(
          label: 'Redeem',
          onPressed: () {},
          borderRadius: 0,
          fontSize: 14,
        ),
      ),
    );
  }
}
