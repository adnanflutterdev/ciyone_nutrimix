import 'package:ciyone_nutrimix/core/constants/app_colors.dart';
import 'package:ciyone_nutrimix/core/utils/sized_box_extension.dart';
import 'package:ciyone_nutrimix/core/utils/theme_extension.dart';
import 'package:ciyone_nutrimix/views/widgets/expand_toggler.dart';
import 'package:flutter/material.dart';

class FaqsDetails extends StatefulWidget {
  const FaqsDetails({super.key});

  @override
  State<FaqsDetails> createState() => _FaqsDetailsState();
}

class _FaqsDetailsState extends State<FaqsDetails> {
  bool isExpanded = false;
  List<Map> faqs = [
    {
      'title': '1. How do I buy/ gift a HK Gift Card?',
      'subtitles': [
        'Enter the name, email address and mobile number of the person you want to send the HealthKart Gift Card to.',
        'Select the value of the card you would like to purchase, then click "Proceed To Pay".',
        'You\'ll now see the payment options. You can pay by Credit Card/Debit Card / UPI/Netbanking. Proceed to pay using your preferred choice.',
        'Complete the checkout process to receive an email and SMS with the Gift Card details.',
      ],
    },
    {
      'title': '2. How do I pay with a HK Gift Card?',
      'subtitles': [
        'You cannot pay directly using HK Gift Card. You need to first redeem the HK Gift Card, and add to HK Cash. You can then pay using HK Cash. b. If the HK Cash value doesn\'t cover your Order total, you will be prompted to select an additional payment method.',
      ],
    },
    {
      'title': '3. Does my HK Gift Card expire?',
      'subtitles': [
        'All HK Gift Cards expire 1 year from the date of their creation.',
      ],
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpandToggler(
          title: 'Faqs',
          onChanged: (value) {
            setState(() {
              isExpanded = value;
            });
          },
        ),
        AnimatedSize(
          duration: const Duration(milliseconds: 300),
          child: isExpanded
              ? Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ListView.builder(
                    itemCount: faqs.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      Map faq = faqs[index];
                      return Column(
                        crossAxisAlignment: .start,
                        children: [
                          Text(faq['title'], style: context.titleSmall),
                          15.h,
                          ListView.builder(
                            itemCount: faq['subtitles'].length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              String subtitle = faq['subtitles'][index];
                              int ascii = 97 + index;

                              return Column(
                                crossAxisAlignment: .start,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: '${String.fromCharCode(ascii)}. ',
                                      style: context.bodyLarge,
                                      children: [
                                        TextSpan(
                                          text: subtitle,
                                          style: context.bodyLarge?.copyWith(
                                            color: AppColors.secondaryTextColor,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  10.h,
                                ],
                              );
                            },
                          ),
                          15.h,
                        ],
                      );
                    },
                  ),
                )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}
