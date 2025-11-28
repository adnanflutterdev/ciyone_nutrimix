import 'package:ciyone_nutrimix/core/constants/app_colors.dart';
import 'package:ciyone_nutrimix/core/constants/app_icons.dart';
import 'package:ciyone_nutrimix/core/utils/app_navigator.dart';
import 'package:ciyone_nutrimix/core/utils/sized_box_extension.dart';
import 'package:ciyone_nutrimix/core/utils/theme_extension.dart';
import 'package:ciyone_nutrimix/views/home/tabs/explore_tab/explore_tab_data.dart';
import 'package:ciyone_nutrimix/views/widgets/custom_icon.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  int filterIndex = 0;
  List<List> filteredData = [[], [], [], []];
  @override
  Widget build(BuildContext context) {
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
          'Filter',
          style: context.titleSmall?.copyWith(fontFamily: 'PoppinsBold'),
        ),
        actions: [
          TextButton(
            onPressed: () {
              filteredData = [[], [], [], []];
              setState(() {});
            },
            child: Text(
              'Clear Filters',
              style: context.bodyLarge?.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: AppColors.borderStrokeColor.withValues(alpha: 0.6),
          ),
        ),
      ),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // width: ScreenSize.width * 40 / 100,
              color: AppColors.borderColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    10.h,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(filters.length, (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              filterIndex = index;
                            });
                          },
                          child: Container(
                            color: Colors.transparent,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                // horizontal: 15.0,
                                vertical: 8,
                              ),
                              child: Row(
                                children: [
                                  CustomIcon(
                                    filterIndex == index
                                        ? AppIcons.activeCircle
                                        : AppIcons.untickCircle,
                                    color: filterIndex == index
                                        ? AppColors.primary
                                        : AppColors.secondaryIconColor,
                                  ),
                                  10.w,
                                  Text(
                                    filters[index]['label'],
                                    style: context.bodyLarge?.copyWith(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                    const Spacer(),
                    Text('1,054', style: context.titleSmall),
                    Text(
                      'Products found',
                      style: context.bodyLarge?.copyWith(
                        color: AppColors.secondaryTextColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    15.h,
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: List.generate(filters[filterIndex]['data'].length, (
                      index,
                    ) {
                      final data = filters[filterIndex]['data'][index];
                      List selectedIndices = filteredData[filterIndex];
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            if (selectedIndices.contains(index)) {
                              selectedIndices.remove(index);
                            } else {
                              selectedIndices.add(index);
                            }
                          });
                        },
                        child: Container(
                          color: Colors.transparent,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15.0,
                              vertical: 8,
                            ),
                            child: Row(
                              children: [
                                CustomIcon(
                                  selectedIndices.contains(index)
                                      ? AppIcons.tickSquare
                                      : AppIcons.untickSquare,
                                  color: selectedIndices.contains(index)
                                      ? AppColors.primary
                                      : AppColors.secondaryIconColor,
                                ),
                                10.w,
                                Expanded(child: Text(data)),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
