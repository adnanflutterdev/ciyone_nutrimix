import 'package:ciyone_nutrimix/core/constants/app_colors.dart';
import 'package:ciyone_nutrimix/core/constants/app_icons.dart';
import 'package:ciyone_nutrimix/core/utils/screen_size.dart';
import 'package:ciyone_nutrimix/core/utils/sized_box_extension.dart';
import 'package:ciyone_nutrimix/core/utils/theme_extension.dart';
import 'package:ciyone_nutrimix/views/home/tabs/profile_tab/views/gift_card/faqs_details.dart';
import 'package:ciyone_nutrimix/views/home/tabs/profile_tab/views/gift_card/healthkart_card.dart';
import 'package:ciyone_nutrimix/views/home/tabs/profile_tab/views/gift_card/terms_and_condition.dart';
import 'package:ciyone_nutrimix/views/widgets/bordered_container.dart';
import 'package:ciyone_nutrimix/views/widgets/buttons.dart';
import 'package:ciyone_nutrimix/views/widgets/custom_app_bar.dart';
import 'package:ciyone_nutrimix/views/widgets/custom_icon.dart';
import 'package:ciyone_nutrimix/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class GiftCardScreen extends StatelessWidget {
  const GiftCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    List<Map> benefits = [
      {'label': 'Applicable on all sales', 'icon': AppIcons.sales},
      {'label': 'One click checkout', 'icon': AppIcons.checkout},
      {'label': 'Applicable to all products', 'icon': AppIcons.products},
      {'label': 'Instant credit to HK cash', 'icon': AppIcons.instantCash},
    ];
    return Scaffold(
      appBar: const CustomAppBar(title: 'Gift Card'),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          controller: scrollController,
          children: [
            10.h,
            const HealthkartCard(),
            30.h,
            BorderedContainer(
              child: Column(
                children: [
                  Text(
                    'Hi Guest!',
                    style: context.titleLarge?.copyWith(fontSize: 20),
                  ),
                  Text(
                    'Buy a gift card now!',
                    style: context.bodyLarge?.copyWith(
                      color: AppColors.secondaryTextColor,
                    ),
                  ),
                  20.h,
                  PrimaryButton(
                    label: 'Buy Now',
                    onPressed: () {},
                    borderRadius: 6,
                    fontSize: 14,
                  ),
                ],
              ),
            ),
            40.h,
            Text('HK Gift Card Benefits', style: context.titleMedium),
            30.h,
            Wrap(
              alignment: WrapAlignment.center,
              children: benefits.map((service) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: SizedBox(
                    width: ScreenSize.width / 2.3,
                    child: Center(
                      child: Column(
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.borderColor,
                            ),
                            child: Center(
                              child: CustomIcon(
                                service['icon'],
                                size: 30,
                                color: AppColors.secondaryIconColor,
                              ),
                            ),
                          ),
                          15.h,
                          Text(
                            service['label'],
                            style: context.bodyLarge,
                            textAlign: .center,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            30.h,
            Text('Redeem Your Gift Card', style: context.bodyLarge),
            10.h,
            const CustomTextField(hintText: 'Enter Gift Card Number'),
            20.h,
            PrimaryButton(
              label: 'Reedem',
              onPressed: () {},
              fontSize: 14,
              borderRadius: 6,
            ),
            35.h,
            const FaqsDetails(),
            20.h,
            TermsAndCondition(scrollController: scrollController),
          ],
        ),
      ),
    );
  }
}
