import 'package:ciyone_nutrimix/core/constants/app_colors.dart';
import 'package:ciyone_nutrimix/core/constants/app_icons.dart';
import 'package:ciyone_nutrimix/core/utils/sized_box_extension.dart';
import 'package:ciyone_nutrimix/core/utils/theme_extension.dart';
import 'package:ciyone_nutrimix/views/widgets/buttons.dart';
import 'package:ciyone_nutrimix/views/widgets/custom_icon.dart';
import 'package:flutter/material.dart';

class HabitsTab extends StatelessWidget {
  const HabitsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Unlock your fitness journey with a short quiz',
              style: context.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            30.h,
            _buildJourney(),
            30.h,
            PrimaryButton(
              label: 'Let\'s Start',
              onPressed: () {},
              borderRadius: 6,
              fontSize: 14,
            ),
            20.h,
            Text(
              'Challenges & booking',
              style: context.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            30.h,
            _buildUnlock(context),
            30.h,
            Text(
              'Recommended products for you',
              style: context.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'Take a short quiz to unlock recommendations',
              style: context.bodyLarge?.copyWith(
                color: AppColors.secondaryTextColor,
                fontWeight: FontWeight.w400,
              ),
            ),
            30.h,
            _buildUnlock(context),
            20.h,
          ],
        ),
      ),
    );
  }

  Widget _buildJourney() {
    return Column(
      children: [
        _buildStep(
          icon: AppIcons.clockColored,
          label: 'Take out 2 mins of your time',
        ),
        _buildStep(
          icon: AppIcons.askColored,
          label: 'Answer few simple questions',
        ),
        _buildStep(
          icon: AppIcons.medicineColored,
          label: 'Get diet report & supplement\nguidance',
          hasLast: false,
        ),
      ],
    );
  }

  Widget _buildStep({
    required String icon,
    required String label,
    bool hasLast = true,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.highlightTextColor.withValues(alpha: 0.09),
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Image.asset(icon, width: 30, height: 30),
              ),
            ),
            20.w,
            Text(label),
          ],
        ),
        if (hasLast)
          const SizedBox(
            width: 60,
            child: Center(
              child: RotatedBox(
                quarterTurns: 1,
                child: SizedBox(
                  width: 30,
                  height: 2,
                  child: Divider(thickness: 2, color: AppColors.primary),
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildUnlock(BuildContext context) {
    return Center(
      child: Column(
        children: [
          CustomIcon(
            size: 50,
            AppIcons.lockCloud,
            color: AppColors.secondaryIconColor.withValues(alpha: 0.5),
          ),
          6.h,
          Text(
            'Unlock me',
            style: context.bodyMedium?.copyWith(
              color: AppColors.secondaryTextColor,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
