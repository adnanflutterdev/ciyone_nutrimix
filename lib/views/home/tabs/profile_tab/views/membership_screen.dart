import 'package:ciyone_nutrimix/core/constants/app_colors.dart';
import 'package:ciyone_nutrimix/core/constants/app_icons.dart';
import 'package:ciyone_nutrimix/core/utils/screen_size.dart';
import 'package:ciyone_nutrimix/core/utils/sized_box_extension.dart';
import 'package:ciyone_nutrimix/core/utils/theme_extension.dart';
import 'package:ciyone_nutrimix/views/widgets/bordered_container.dart';
import 'package:ciyone_nutrimix/views/widgets/buttons.dart';
import 'package:ciyone_nutrimix/views/widgets/custom_app_bar.dart';
import 'package:ciyone_nutrimix/views/widgets/custom_icon.dart';
import 'package:flutter/material.dart';

class MembershipScreen extends StatefulWidget {
  const MembershipScreen({super.key});

  @override
  State<MembershipScreen> createState() => _MembershipScreenState();
}

class _MembershipScreenState extends State<MembershipScreen> {
  int stepperIndex = 0;

  List<Map> stepperData = [
    {'label': 'Basic', 'value': '₹0'},
    {'label': 'Premium', 'value': '₹10,000'},
    {'label': 'Select', 'value': '₹10,000'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'HK Membership'),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            Row(
              children: [
                Text(
                  'Your\nReward Journey',
                  style: context.titleSmall,
                  textAlign: TextAlign.center,
                ),
                const Spacer(),
                Text(
                  'Remaining: ₹10,000',
                  style: context.bodyMedium?.copyWith(
                    color: AppColors.secondaryTextColor,
                  ),
                ),
              ],
            ),
            30.h,
            Row(
              children: List.generate(3, (index) {
                return _buildStepper(stepperIndex: stepperIndex, index: index);
              }),
            ),
            40.h,
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: AppColors.borderColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      title: Row(
                        children: [
                          const CustomIcon(AppIcons.premium, size: 26),
                          12.w,
                          Text('Premium', style: context.titleSmall),
                        ],
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          'Or Shop For ₹10,000 And Get Premium For Free.',
                          style: context.bodyLarge?.copyWith(
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      trailing: Column(
                        children: [
                          Text(
                            '₹299',
                            style: context.titleMedium?.copyWith(fontSize: 20),
                          ),
                          Text(
                            'year',
                            style: context.bodyLarge?.copyWith(
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                    25.h,
                    const PrimaryButton(
                      label: 'Buy Now',
                      onPressed: null,
                      fontSize: 14,
                      borderRadius: 6,
                    ),
                  ],
                ),
              ),
            ),
            40.h,
            Text('Benefits you will unlock', style: context.titleMedium),
            15.h,
            _buildBenefits(
              context,
              icon: AppIcons.offer,
              content: 'Unlock Extra Discount & low Prices',
            ),
            _buildBenefits(
              context,
              icon: AppIcons.instant,
              content: 'Instant Extra Discount In Flash Sales/ BOGO',
            ),
            _buildBenefits(
              context,
              icon: AppIcons.shop,
              content: 'Enjoy Benefits At HK Retail Stores',
            ),
            30.h,
            Text('Compare Membership', style: context.titleMedium),
            30.h,
            Row(
              mainAxisAlignment: .spaceAround,
              children: [
                _buildMemberShip(
                  context,
                  title: 'Premium',
                  color: AppColors.ratingColor,
                ),
                _buildMemberShip(
                  context,
                  title: 'Select',
                  color: AppColors.stepperActiveColor,
                ),
              ],
            ),
            30.h,
            Text('Terms & Conditions', style: context.titleMedium),
            10.h,
            _buildLinkText(
              context,
              link: 'Terms & Conditions',
              text: ' of the healthkart’s loyalty program',
            ),
            30.h,
            Text('FAQs', style: context.titleMedium),
            10.h,
            _buildLinkText(
              context,
              link: 'FAQs',
              text: ' of the healthkart’s loyalty program',
            ),
            30.h,
          ],
        ),
      ),
    );
  }

  Widget _buildBenefits(
    BuildContext context, {
    required String icon,
    required String content,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 7.5),
      child: Row(
        children: [
          SizedBox(width: 18, child: CustomIcon(icon, size: 18)),
          10.w,
          Expanded(
            child: Text(
              content,
              style: context.bodyLarge?.copyWith(
                color: AppColors.secondaryTextColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLinkText(
    BuildContext context, {
    required String link,
    required String text,
  }) {
    return RichText(
      text: TextSpan(
        text: link,
        style: context.bodyLarge?.copyWith(decoration: .underline),
        children: [
          TextSpan(
            text: text,
            style: context.bodyLarge?.copyWith(
              color: AppColors.secondaryTextColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMemberShip(
    BuildContext context, {
    required String title,
    required Color color,
  }) {
    final width = (ScreenSize.width - 40) / 2;
    return SizedBox(
      width: width,
      child: Column(
        children: [
          Container(
            width: width - 14,
            padding: const EdgeInsets.symmetric(vertical: 7),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              color: color,
            ),
            child: Center(
              child: Text(
                title,
                style: context.bodyLarge?.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          BorderedContainer(
            width: width,
            child: Column(
              children: [
                _buildMembershipRow(
                  context,
                  color: color,
                  middle: 'Extra ',
                  trailing: '3% Off',
                ),
                15.h,
                _buildMembershipRow(
                  context,
                  color: color,
                  middle: 'Extra ',
                  trailing: '2% HK Cash',
                ),
                15.h,
                _buildMembershipRow(
                  context,
                  color: color,
                  leading: '5% Off ',
                  middle: 'On ',
                  trailing: 'Flashsale',
                ),
                15.h,
                _buildMembershipRow(
                  context,
                  color: color,
                  middle: 'Exclusive ',
                  trailing: 'Launch Offers',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMembershipRow(
    BuildContext context, {
    required Color color,
    String? leading,
    required String middle,
    required String trailing,
  }) {
    return Row(
      crossAxisAlignment: .start,
      children: [
        CustomIcon(AppIcons.tickCircle, color: color),
        6.w,
        Expanded(
          child: RichText(
            text: TextSpan(
              children: [
                if (leading != null)
                  TextSpan(text: leading, style: context.bodyMedium),
                TextSpan(
                  text: middle,
                  style: context.bodyMedium?.copyWith(
                    color: AppColors.secondaryTextColor,
                  ),
                ),
                TextSpan(text: trailing, style: context.bodyMedium),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStepper({required int stepperIndex, required int index}) {
    return Expanded(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Divider(
                  color: index == 0
                      ? Colors.transparent
                      : stepperIndex >= index
                      ? AppColors.stepperActiveColor
                      : AppColors.borderColor,
                ),
              ),
              CustomIcon(
                stepperIndex > index
                    ? AppIcons.tickCircle
                    : stepperIndex == index
                    ? AppIcons.activeCircle
                    : AppIcons.untickCircle,
                color: stepperIndex > index
                    ? AppColors.stepperActiveColor
                    : stepperIndex == index
                    ? AppColors.stepperActiveColor
                    : AppColors.borderColor,
              ),
              Expanded(
                child: Divider(
                  color: index == 2
                      ? Colors.transparent
                      : stepperIndex > index
                      ? AppColors.stepperActiveColor
                      : AppColors.borderColor,
                ),
              ),
            ],
          ),
          Text(
            stepperData[index]['label'],
            style: context.bodySmall?.copyWith(fontWeight: FontWeight.w600),
          ),
          RichText(
            text: TextSpan(
              text: 'Spend ',
              style: context.bodySmall?.copyWith(
                color: AppColors.secondaryTextColor,
              ),
              children: [
                TextSpan(
                  text: stepperData[index]['value'],
                  style: context.bodySmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
