import 'package:ciyone_nutrimix/core/constants/app_colors.dart';
import 'package:ciyone_nutrimix/core/constants/app_icons.dart';
import 'package:ciyone_nutrimix/core/utils/app_navigator.dart';
import 'package:ciyone_nutrimix/core/utils/screen_size.dart';
import 'package:ciyone_nutrimix/core/utils/sized_box_extension.dart';
import 'package:ciyone_nutrimix/core/utils/theme_extension.dart';
import 'package:ciyone_nutrimix/views/widgets/custom_icon.dart';
import 'package:ciyone_nutrimix/views/widgets/expand_toggler.dart';
import 'package:flutter/material.dart';

class CategoryDetails extends StatelessWidget {
  const CategoryDetails({super.key, required this.category});
  final Map category;

  @override
  Widget build(BuildContext context) {
    List<String> labels = [
      'Proteins',
      'Gainers',
      'protein foods',
      'pre/post workout',
      'workout essentials',
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
          category['label'],
          style: context.titleSmall?.copyWith(fontFamily: 'PoppinsBold'),
        ),

        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: AppColors.borderStrokeColor.withValues(alpha: 0.6),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              20.h,
              Center(
                child: Container(
                  width: (ScreenSize.width - 45) / 2,
                  height: (ScreenSize.width) / 2,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: AlignmentGeometry.topCenter,
                      end: AlignmentGeometry.bottomCenter,
                      colors: [
                        category['color'].withValues(alpha: 0.4),
                        category['color'].withValues(alpha: 0.8),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.borderColor),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(category['image']),
                        15.h,
                        Text(
                          category['label'],
                          style: context.bodyLarge,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              30.h,
              Column(
                children: labels.map((label) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: ExpandToggler(title: label, onChanged: null),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
