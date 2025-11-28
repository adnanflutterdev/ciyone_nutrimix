import 'package:ciyone_nutrimix/core/constants/app_colors.dart';
import 'package:ciyone_nutrimix/core/constants/app_icons.dart';
import 'package:ciyone_nutrimix/core/utils/app_navigator.dart';
import 'package:ciyone_nutrimix/core/utils/sized_box_extension.dart';
import 'package:ciyone_nutrimix/core/utils/theme_extension.dart';
import 'package:ciyone_nutrimix/views/widgets/custom_icon.dart';
import 'package:ciyone_nutrimix/views/widgets/custom_text_field.dart';
import 'package:ciyone_nutrimix/views/widgets/show_app_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle? hintStyle = context.bodyLarge;
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
          'Get in touch with us',
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
        child: ListView(
          children: [
            10.h,
            CustomTextField(
              readOnly: true,
              prefixIcon: const CustomIcon(
                AppIcons.chatWithUs,
                size: 18,
                color: AppColors.primary,
                horzontalPadding: 12,
              ),
              hintText: 'Chat With Us',
              hintStyle: hintStyle,
            ),
            30.h,
            Text(
              'Contact Us',
              style: context.titleMedium,
            ),
            Text(
              'Speak with our customer support',
              style: context.bodyLarge?.copyWith(
                fontWeight: FontWeight.normal,
                color: AppColors.secondaryTextColor,
              ),
            ),
            20.h,
            CustomTextField(
              readOnly: true,
              prefixIcon: const CustomIcon(
                AppIcons.callCalling,
                size: 18,
                color: AppColors.primary,
                horzontalPadding: 12,
              ),
              suffixIcon: CustomIcon(
                AppIcons.simcard,
                size: 18,
                color: AppColors.secondaryIconColor,
                horzontalPadding: 12,
                onPressed: () {
                  Clipboard.setData(const ClipboardData(text: '0124-461644'));
                  showAppSnackbar(
                    context: context,
                    message: 'Text Copied to ClipBoard',
                  );
                },
              ),
              hintText: '0124-461644',
              hintStyle: hintStyle,
            ),
            20.h,
            CustomTextField(
              readOnly: true,
              prefixIcon: const CustomIcon(
                AppIcons.mail,
                size: 18,
                color: AppColors.primary,
                horzontalPadding: 12,
              ),
              suffixIcon: CustomIcon(
                AppIcons.simcard,
                size: 18,
                color: AppColors.secondaryIconColor,
                horzontalPadding: 12,
                onPressed: () {
                  Clipboard.setData(
                    const ClipboardData(text: 'Care@healthkart.com'),
                  );
                  showAppSnackbar(
                    context: context,
                    message: 'Text Copied to ClipBoard',
                  );
                },
              ),
              hintText: 'Care@healthkart.com',
              hintStyle: hintStyle,
            ),
            20.h,
            CustomTextField(
              readOnly: true,
              prefixIcon: const CustomIcon(
                AppIcons.user,
                size: 18,
                color: AppColors.primary,
                horzontalPadding: 12,
              ),

              hint: Row(
                children: [
                  Text(
                    'Hours of Operation: ',
                    style: hintStyle?.copyWith(
                      color: AppColors.secondaryTextColor,
                    ),
                  ),
                  Text('10 AM - 7 PM', style: hintStyle),
                ],
              ),
              hintStyle: hintStyle,
            ),
            30.h,
            Text(
              'Address Information',
              style: context.titleMedium,
            ),
            10.h,
            CustomTextField(
              readOnly: true,
              hint: Column(
                crossAxisAlignment: .start,
                children: [
                  Text(
                    'Bright Lifecare Pvt. Ltd.',
                    style: hintStyle?.copyWith(
                      color: AppColors.secondaryTextColor,
                    ),
                  ),
                  7.h,
                  Text(
                    '3rd Floor, Parsvnath Arcadia, T 01, MG Road Sector-14, Gurgaon - 122001, Haryana, India.',
                    style: hintStyle?.copyWith(
                      fontWeight: FontWeight.normal,
                      color: AppColors.secondaryTextColor,
                    ),
                  ),
                ],
              ),
              hintStyle: hintStyle,
            ),
            30.h,
            Text(
              'Sell With Us',
              style: context.titleMedium,
            ),
            Text(
              'Write to us at',
              style: context.bodyLarge?.copyWith(
                fontWeight: FontWeight.normal,
                color: AppColors.secondaryTextColor,
              ),
            ),
            10.h,
            Text(
              'For Vendor & Partner Support',
              style: context.bodyLarge?.copyWith(
                color: AppColors.secondaryTextColor,
              ),
            ),
            10.h,
            CustomTextField(
              readOnly: true,
              prefixIcon: const CustomIcon(
                AppIcons.mail,
                size: 18,
                color: AppColors.primary,
                horzontalPadding: 12,
              ),
              suffixIcon: CustomIcon(
                AppIcons.simcard,
                size: 18,
                color: AppColors.secondaryIconColor,
                horzontalPadding: 12,
                onPressed: () {
                  Clipboard.setData(
                    const ClipboardData(text: 'sellers@brightlifecare.com'),
                  );
                  showAppSnackbar(
                    context: context,
                    message: 'Text Copied to ClipBoard',
                  );
                },
              ),
              hintText: 'sellers@brightlifecare.com',
              hintStyle: hintStyle,
            ),
            30.h,
          ],
        ),
      ),
    );
  }
}
