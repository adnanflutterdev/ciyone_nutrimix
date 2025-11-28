import 'dart:async';

import 'package:ciyone_nutrimix/core/constants/app_colors.dart';
import 'package:ciyone_nutrimix/core/utils/sized_box_extension.dart';
import 'package:ciyone_nutrimix/core/utils/theme_extension.dart';
import 'package:ciyone_nutrimix/views/widgets/expand_toggler.dart';
import 'package:flutter/material.dart';

class TermsAndCondition extends StatefulWidget {
  const TermsAndCondition({super.key, required this.scrollController});
  final ScrollController scrollController;

  @override
  State<TermsAndCondition> createState() => _TermsAndConditionState();
}

class _TermsAndConditionState extends State<TermsAndCondition> {
  bool isExpanded = false;

  List<String> termsAndContition = [
    'Gift Cards are issued by HealthKart.',
    'The Gift Cards can be redeemed online againstSellers listed on www.healthkart.com only.',
    'Gift Cards can be redeemed by selecting the payment mode as Gift Card. They can NOT be used to purchase HK Premium.',
    'Gift Cards cannot be used to purchase other Gift Cards. Gift Cards cannot be reloaded or resold.',
    ' If the order value exceeds the Gift Card amount, the balance must be paid by Credit Card/Debit Card/Internet Banking. Cash on Delivery payment option cannot be used to pay the balance amount',
    'If the order value is less than the amount of the HK Cash via Gift Card, the outstanding balance (after deduction of order value) will reflect under the HK Cash balance.',
    'Gift Cards and their corresponding unused balance will expire 12 months from the date of issue.',
    'Gift Cards cannot be redeemed for Cash or Credit, but are transferable.',
    'HealthKart.com are not responsible if Gift Card is lost, stolen or used without permission.',
    'HealthKart.com assumes no responsibility for the products purchased using the Gift Cards and any liability thereof is expressly disclaimed.',
    'Validity of Gift Cards cannot be extended, new Gift Cards cannot be provided against the expired/ unused Gift Cards.',
    'In the event the beneficiary/Know Your Customer (KYC) details are found to be incorrect/ insufficient, HealthKart.com retains the right to cancel the Gift Card issued.',
    'HK Gift Cards cannot be refunded or returned.',
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpandToggler(
          value: 'Terms & Condition',
          onChanged: (value) {
            isExpanded = value;
            setState(() {});
            Future.delayed(const Duration(milliseconds: 200), () {
              if (isExpanded) {
                widget.scrollController.animateTo(
                  widget.scrollController.position.maxScrollExtent - 100,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.bounceInOut,
                );
              }
            });
          },
        ),
        AnimatedSize(
          duration: const Duration(milliseconds: 300),
          child: isExpanded
              ? Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ListView.builder(
                    itemCount: termsAndContition.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: .start,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: '${index + 1}. ',
                              style: context.titleSmall,
                              children: [
                                TextSpan(
                                  text: termsAndContition[index],
                                  style: context.titleSmall?.copyWith(
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
                )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}
