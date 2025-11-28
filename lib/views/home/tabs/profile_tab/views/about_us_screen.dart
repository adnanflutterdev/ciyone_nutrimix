import 'package:ciyone_nutrimix/core/constants/app_colors.dart';
import 'package:ciyone_nutrimix/core/constants/app_icons.dart';
import 'package:ciyone_nutrimix/core/utils/screen_size.dart';
import 'package:ciyone_nutrimix/core/utils/sized_box_extension.dart';
import 'package:ciyone_nutrimix/core/utils/theme_extension.dart';
import 'package:ciyone_nutrimix/views/widgets/buttons.dart';
import 'package:ciyone_nutrimix/views/widgets/custom_app_bar.dart';
import 'package:ciyone_nutrimix/views/widgets/custom_icon.dart';
import 'package:ciyone_nutrimix/views/widgets/invite_and_earn.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map> services = [
      {'label': 'easy payment options', 'icon': AppIcons.easyPaymentOptions},
      {'label': 'secure packaging', 'icon': AppIcons.securePackaging},
      {'label': 'fast delivery', 'icon': AppIcons.fastDelivery},
      {'label': '14 day return policy', 'icon': AppIcons.returnPolicy},
    ];
    return Scaffold(
      appBar: const CustomAppBar(title: 'About Us'),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            Text(
              'Hello!',
              style: context.titleLarge?.copyWith(
                fontWeight: FontWeight.normal,
              ),
            ),
            15.h,
            Text(
              'We\'re Health Kart- a great place for people serious about health. and fitness.',
              style: context.titleSmall?.copyWith(
                fontWeight: FontWeight.normal,
              ),
            ),
            15.h,
            Text(
              'We\'re a young start-up of around 400 people that work for your needs in fitness and well-being. We deliver everything from genuine protein supplements to vitamins smoothly at honest prices.',
              style: context.bodyLarge?.copyWith(
                color: AppColors.secondaryTextColor,
              ),
            ),
            30.h,
            Wrap(
              alignment: WrapAlignment.center,
              children: services.map((service) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: SizedBox(
                    width: ScreenSize.width / 2.7,
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
            Text(
              'We do what\'s right by you. We value authenticity over everything else.',
              style: context.titleSmall?.copyWith(
                fontWeight: FontWeight.normal,
              ),
            ),
            15.h,
            Text(
              'We sell consumables that you need rather than want. In such cases, the authenticity of the product matters. Half the supplement market is flooded with fakes pumped with steroids. And that\'s why when you shop whey from us, be sure it is 100% genuine, without any junk.',
              style: context.bodyLarge?.copyWith(
                color: AppColors.secondaryTextColor,
              ),
            ),
            15.h,
            Text(
              'Whenever you see this logo next to our product, it\'s just our way of telling you that we\'ve sourced the product directly and test it before sending it out to you. It is to tell you that what you are having is safe.',
              style: context.bodyLarge?.copyWith(
                color: AppColors.secondaryTextColor,
              ),
            ),
            15.h,
            Text(
              'Check out why authenticity matters',
              style: context.bodyLarge?.copyWith(
                color: AppColors.stepperActiveColor,
                fontWeight: FontWeight.normal,
              ),
            ),
            25.h,
            DottedBorder(
              options: const RectDottedBorderOptions(
                dashPattern: [6, 3],
                strokeWidth: 1,
                borderPadding: EdgeInsets.all(0.3),
                color: AppColors.borderStrokeColor,
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                // decoration: BoxDecoration(border: Border.all()),
                child: Center(
                  child: Text(
                    'AUTHENTICITY GUARANTEED',
                    style: context.titleLarge?.copyWith(
                      color: AppColors.secondaryTextColor,
                    ),
                  ),
                ),
              ),
            ),
            25.h,
            Text(
              'Good health delivered to your doorstep, every time',
              style: context.titleSmall?.copyWith(
                fontWeight: FontWeight.normal,
              ),
            ),
            20.h,
            Text(
              'You no longer have to hunt for your supplements or a ton of nutrition stores to find the supplement you need. We have over 200 brands & authorized vendors listed on our website. All just to make sure what you get is right.',
              style: context.bodyLarge?.copyWith(
                color: AppColors.secondaryTextColor,
              ),
            ),
            40.h,
            GridView.builder(
              itemCount: 6,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
              ),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: AppColors.borderColor),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/top_brands/brand${index + 1}.png',
                    ),
                  ),
                );
              },
            ),
            30.h,
            Text(
              'How it came together?',
              style: context.titleSmall?.copyWith(
                fontWeight: FontWeight.normal,
              ),
            ),
            15.h,
            Text(
              'We worked really hard to get here. We enjoy doing things fast, failing quickly and putting all that we learnt in our next idea. Our team has people from premier institutes around the world, but we\'re proud to say that we learnt most when we were on the job.',
              style: context.bodyLarge?.copyWith(
                color: AppColors.secondaryTextColor,
              ),
            ),
            15.h,
            Text(
              'Some of the hard work we put together is right here.',
              style: context.bodyLarge?.copyWith(
                color: AppColors.secondaryTextColor,
              ),
            ),
            30.h,
            Center(child: Image.asset('assets/bg/about_us.png', height: 200)),
            30.h,
            PrimaryButton(
              label: 'Want To Work With Us?',
              fontSize: 14,
              borderRadius: 6,
              onPressed: () {},
            ),
            30.h,
            const InviteAndEarn(),
            20.h,
          ],
        ),
      ),
    );
  }
}
