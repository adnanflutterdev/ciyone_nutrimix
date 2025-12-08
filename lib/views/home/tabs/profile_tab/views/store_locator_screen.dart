import 'package:ciyone_nutrimix/core/constants/app_colors.dart';
import 'package:ciyone_nutrimix/core/constants/app_icons.dart';
import 'package:ciyone_nutrimix/core/utils/sized_box_extension.dart';
import 'package:ciyone_nutrimix/core/utils/theme_extension.dart';
import 'package:ciyone_nutrimix/views/widgets/custom_app_bar.dart';
import 'package:ciyone_nutrimix/views/widgets/custom_icon.dart';
import 'package:ciyone_nutrimix/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class StoreLocatorScreen extends StatelessWidget {
  const StoreLocatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map> services = [
      {
        'title': 'Pick it up at the store or get it delivered',
        'subtitle':
            'Never run out of your health stack, step into the store near you or get your stock of supplements delivered at your doorstep.',
        'icon': AppIcons.pickUp,
      },
      {
        'title': 'Earn HK Cash With Every Purchase',
        'subtitle':
            'Every time you shop with us you get rewarded with HK Cash for your future purchases. You can spend them both at our.',
        'icon': AppIcons.discountTag,
      },
      {
        'title': 'Easy Return Policy',
        'subtitle':
            'You can always go back to a store near you and return products within 14 days without any hassle if unsatisfied.',
        'icon': AppIcons.easyReturn,
      },
      {
        'title': 'Expert Guidance',
        'subtitle':
            'Our experts will be happy to guide while you shop at our store. Know from them, supplements that will work depending on your fitness goals.',
        'icon': AppIcons.expertGuidance,
      },
      {
        'title': 'Special Offers',
        'subtitle':
            'Keep visiting our stores for latest supplement tastings, special weekly deals, freebies and discounts.',
        'icon': AppIcons.specialOffers,
      },
    ];
    return Scaffold(
      appBar: const CustomAppBar(title: 'Find Store'),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            10.h,
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60.0),
                child: Image.asset('assets/bg/store_locator.png'),
              ),
            ),
            30.h,
            Center(
              child: Text(
                '162 stores in 72 cities',
                style: context.titleMedium,
              ),
            ),
            4.h,
            Center(
              child: Text(
                'across india & still counting...',
                style: context.bodyLarge?.copyWith(
                  color: AppColors.secondaryTextColor,
                ),
              ),
            ),
            40.h,
            Row(
              children: [
                const CustomIcon(
                  AppIcons.location,
                  size: 22,
                  color: AppColors.primary,
                ),
                8.w,
                Text('Change Location', style: context.titleSmall),
              ],
            ),
            4.h,
            Text(
              'Select new locations to find more stores',
              style: context.bodyLarge?.copyWith(
                color: AppColors.secondaryTextColor,
              ),
            ),
            15.h,
            CustomTextField(
              hintText: 'Tirunelveli',
              hintStyle: context.bodyLarge?.copyWith(color: AppColors.secondaryTextColor),
            ),
            40.h,
            Row(
              children: [
                const CustomIcon(
                  AppIcons.location,
                  size: 22,
                  color: AppColors.primary,
                ),
                8.w,
                Text('Exclusive Store Services', style: context.titleSmall),
              ],
            ),
            20.h,
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: services.length,
              itemBuilder: (context, index) {
                return _bulildService(
                  context,
                  service: services[index],
                  index: index,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _bulildService(
    BuildContext context, {
    required Map service,
    required int index,
  }) {
    Container icon = Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.borderColor,
        border: Border.all(
          color: AppColors.borderStrokeColor.withValues(alpha: 0.3),
        ),
      ),
      child: Center(
        child: CustomIcon(
          service['icon'],
          size: 40,
          color: AppColors.secondaryIconColor,
        ),
      ),
    );
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: Row(
        children: [
          if (index % 2 != 0) icon,
          if (index % 2 != 0) 10.w,
          Expanded(
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Text(service['title'], style: context.bodyLarge),
                15.h,
                Text(
                  service['subtitle'],
                  style: context.bodyMedium?.copyWith(
                    color: AppColors.secondaryTextColor,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          if (index % 2 == 0) 10.w,
          if (index % 2 == 0) icon,
        ],
      ),
    );
  }
}
