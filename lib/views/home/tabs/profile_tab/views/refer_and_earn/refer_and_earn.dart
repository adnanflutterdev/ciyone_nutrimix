import 'package:ciyone_nutrimix/core/constants/app_colors.dart';
import 'package:ciyone_nutrimix/core/constants/app_icons.dart';
import 'package:ciyone_nutrimix/core/utils/sized_box_extension.dart';
import 'package:ciyone_nutrimix/core/utils/theme_extension.dart';
import 'package:ciyone_nutrimix/views/home/tabs/profile_tab/views/refer_and_earn/expanded_content.dart';
import 'package:ciyone_nutrimix/views/home/tabs/profile_tab/views/refer_and_earn/my_referrals.dart';
import 'package:ciyone_nutrimix/views/widgets/bordered_container.dart';
import 'package:ciyone_nutrimix/views/widgets/buttons.dart';
import 'package:ciyone_nutrimix/views/widgets/custom_app_bar.dart';
import 'package:ciyone_nutrimix/views/widgets/custom_icon.dart';
import 'package:ciyone_nutrimix/views/widgets/custom_text_field.dart';
import 'package:ciyone_nutrimix/views/widgets/show_app_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ReferAndEarn extends StatelessWidget {
  const ReferAndEarn({super.key});

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    List<String> socialIcons = [
      'assets/social/gmail.png',
      'assets/social/whatsapp.png',
      'assets/social/share.png',
    ];
    List<Map> steps = [
      {
        'icon': AppIcons.display,
        'content':
            'Login or sign up at healthkart & share a unique referral link with your friends.',
      },
      {
        'icon': AppIcons.purchaceCart,
        'content':
            'Your friends receives rs. 200 off, valid on their first purchase.',
      },
      {
        'icon': AppIcons.shopSquared,
        'content':
            'After your friend shops with us, you get rs.200 off on your next order.',
      },
    ];
    List<String> howItWorks = [
      'Enter your name and mobile & share your unique referral link with friends.',
      'Your friend receives Rs. 200 off, valid on their first purchase. ',
      'After your friend receives their order, you get Rs. 200 off on your next order.',
    ];
    List<String> tAndC = [
      'In case you do not receive a coupon, send us an email with your referred friend\'s & your details',
      'Additional cash on delivery and shipping charges applicable',
      'Referral coupon cannot be clubbed with any additional offer/coupon',
      'Offer is applicable only when your friend keeps the order beyond the 14-day return policy',
      'Referral coupon is valid only on order value above Rs. 1999 on healthkart.com',
      'Referee coupon is valid only on order value above Rs. 1299 on healthkart.com',
      'You may avail the offer until stocks last or during the offer period, whichever is earlier',
      'Offer may vary from time to time based on company\'s discretion',
      'Your name and image may be used in any publicity material',
      'Offer valid only if purchase is made through referral link or unique personalized coupon code',
    ];
    List<Map> referrals = [
      {'label': 'Invites Sent', 'value': '2'},
      {'label': 'Clicks', 'value': '0'},
      {'label': 'Converts', 'value': '0'},
    ];
    return Scaffold(
      appBar: const CustomAppBar(title: 'Refer And Earn'),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          controller: scrollController,
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
                'Share with your friends',
                style: context.titleMedium,
              ),
            ),
            20.h,
            CustomTextField(
              readOnly: true,
              hintText: 'https://hk.ref-r.com/1895/803924',
              hintStyle: context.bodyLarge?.copyWith(
                fontWeight: FontWeight.normal,
              ),
              suffixIcon: CustomIcon(
                AppIcons.simcard,
                size: 18,
                color: AppColors.secondaryIconColor,
                horzontalPadding: 12,
                onPressed: () {
                  Clipboard.setData(
                    const ClipboardData(
                      text: 'https://hk.ref-r.com/1895/803924',
                    ),
                  );
                  showAppSnackbar(
                    context: context,
                    message: 'Text Copied to ClipBoard',
                  );
                },
              ),
            ),
            25.h,
            Row(
              mainAxisAlignment: .center,
              children: socialIcons
                  .map(
                    (icon) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColors.borderColor),
                        ),
                        child: Image.asset(icon, width: 20, height: 20),
                      ),
                    ),
                  )
                  .toList(),
            ),
            25.h,
            Center(
              child: Text(
                'How It Works?  |  T&C  |  My Referrals',
                style: context.bodyMedium,
              ),
            ),
            40.h,
            Text(
              'Staying fit is easier with friends',
              style: context.titleMedium,
            ),
            10.h,
            Text(
              'Tell your friends to shop at healthkart. they get rs.200 off on their first order & you get rs.200 off on your next order',
              style: context.bodyLarge?.copyWith(
                color: AppColors.secondaryTextColor,
              ),
            ),
            40.h,
            Center(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: steps.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  Map step = steps[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40.0,
                      vertical: 10,
                    ),
                    child: BorderedContainer(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 30.0,
                        ),
                        child: Column(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                color: AppColors.borderColor,
                                shape: BoxShape.circle,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: CustomIcon(
                                  step['icon'],
                                  size: 30,
                                  color: AppColors.secondaryIconColor,
                                ),
                              ),
                            ),
                            20.h,
                            Text(
                              'Step ${index + 1}',
                              style: context.titleSmall,
                            ),
                            8.h,
                            Text(
                              step['content'],
                              style: context.bodyLarge?.copyWith(
                                color: AppColors.secondaryTextColor,
                              ),
                              textAlign: .center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            20.h,
            const PrimaryButton(
              label: 'Invite Friend & Earn',
              onPressed: null,
              fontSize: 14,
              borderRadius: 6,
            ),
            30.h,
            ExpandedContent(
              title: 'How It Works',
              contents: howItWorks,
              scrollController: scrollController,
            ),
            20.h,
            ExpandedContent(
              title: 'T & C',
              contents: tAndC,
              scrollController: scrollController,
            ),
            20.h,
            MyReferrals(
              title: 'My Referrals',
              contents: referrals,
              scrollController: scrollController,
            ),
          ],
        ),
      ),
    );
  }
}
