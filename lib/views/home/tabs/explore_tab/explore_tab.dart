import 'package:ciyone_nutrimix/core/constants/app_colors.dart';
import 'package:ciyone_nutrimix/core/constants/app_icons.dart';
import 'package:ciyone_nutrimix/core/utils/app_navigator.dart';
import 'package:ciyone_nutrimix/core/utils/sized_box_extension.dart';
import 'package:ciyone_nutrimix/core/utils/theme_extension.dart';
import 'package:ciyone_nutrimix/views/cart/cart_screen.dart';
import 'package:ciyone_nutrimix/views/home/tabs/explore_tab/category_details.dart';
import 'package:ciyone_nutrimix/views/home/tabs/explore_tab/explore_tab_data.dart';
import 'package:ciyone_nutrimix/views/home/tabs/explore_tab/search_screen.dart';
import 'package:ciyone_nutrimix/views/widgets/custom_icon.dart';
import 'package:flutter/material.dart';

class ExploreTab extends StatelessWidget {
  const ExploreTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 8.0,
            ),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      AppNavigator.push(const SearchScreen());
                    },
                    child: TextField(
                      decoration: InputDecoration(
                        enabled: false,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),

                        prefixIcon: const CustomIcon(AppIcons.search, size: 18),
                        prefixIconConstraints: const BoxConstraints(
                          minWidth: 40,
                          minHeight: 18,
                        ),
                        suffixIcon: const CustomIcon(
                          AppIcons.microphone,
                          size: 18,
                          color: AppColors.secondaryIconColor,
                        ),
                        suffixIconConstraints: const BoxConstraints(
                          minWidth: 40,
                          minHeight: 18,
                        ),
                        hintText: 'Search for order here',
                        hintStyle: context.bodyLarge?.copyWith(
                          color: AppColors.secondaryTextColor,
                          fontWeight: FontWeight.normal,
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: const BorderSide(
                            color: AppColors.borderColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                15.w,
                CustomIcon(
                  AppIcons.cart,
                  size: 22,
                  onPressed: () {
                    AppNavigator.push(const CartScreen());
                  },
                ),
              ],
            ),
          ),
          const Divider(color: AppColors.borderStrokeColor),
          15.h,
          Padding(
            padding: const EdgeInsetsGeometry.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Top Brands', style: context.titleSmall),
                15.h,
                GridView.builder(
                  itemCount: 11,
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
                25.h,
                Text('Shop by Categories', style: context.titleSmall),
                15.h,
                GridView.builder(
                  itemCount: categories.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.82,
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                  ),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    return GestureDetector(
                      onTap: () {
                        AppNavigator.push(CategoryDetails(category: category));
                      },
                      child: Container(
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
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
