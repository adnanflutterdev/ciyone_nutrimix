import 'package:ciyone_nutrimix/core/constants/app_colors.dart';
import 'package:ciyone_nutrimix/core/constants/app_icons.dart';
import 'package:ciyone_nutrimix/core/utils/app_navigator.dart';
import 'package:ciyone_nutrimix/core/utils/theme_extension.dart';
import 'package:ciyone_nutrimix/views/widgets/custom_icon.dart';
import 'package:ciyone_nutrimix/views/widgets/expand_toggler.dart';
import 'package:ciyone_nutrimix/views/widgets/invite_and_earn.dart';
import 'package:flutter/material.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> faqs = [
      'Account Related',
      'Order Status Related',
      'Payment Related',
      'Delivery Related',
      'Cancellations & Modifications',
      'Returns & Refunds',
      'Returns & Refunds',
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
          'FAQs',
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
        child: ListView.builder(
          itemCount: faqs.length + 1,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: index == faqs.length
                  ? const InviteAndEarn()
                  : ExpandToggler(value: faqs[index]),
            );
          },
        ),
      ),
    );
  }
}
