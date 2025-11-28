import 'package:flutter/material.dart';
import 'package:ciyone_nutrimix/dummy_data/chips.dart';
import 'package:ciyone_nutrimix/core/utils/screen_size.dart';
import 'package:ciyone_nutrimix/core/utils/app_navigator.dart';
import 'package:ciyone_nutrimix/core/constants/app_icons.dart';
import 'package:ciyone_nutrimix/core/constants/app_colors.dart';
import 'package:ciyone_nutrimix/views/widgets/custom_icon.dart';
import 'package:ciyone_nutrimix/core/utils/theme_extension.dart';
import 'package:ciyone_nutrimix/core/utils/sized_box_extension.dart';
import 'package:ciyone_nutrimix/core/constants/text_field_border.dart';
import 'package:ciyone_nutrimix/views/home/tabs/home_tab/widgets/home_tab_chips.dart';
import 'package:ciyone_nutrimix/views/home/tabs/explore_tab/search_screen.dart';
import 'package:ciyone_nutrimix/views/home/tabs/home_tab/widgets/home_products.dart';
import 'package:ciyone_nutrimix/views/home/tabs/home_tab/wire_frame/carousel_wireframe.dart';

class HomeTabWireframe extends StatelessWidget {
  const HomeTabWireframe({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // App bar
        //
        SizedBox(
          width: ScreenSize.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                const Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Ciyone Nutrimix',
                        style: TextStyle(
                          letterSpacing: 1,
                          fontSize: 22,
                          fontFamily: 'PoppinsBold',
                        ),
                      ),
                    ),

                    CustomIcon(AppIcons.cart, size: 22),
                  ],
                ),
                8.h,
                GestureDetector(
                  onTap: () {
                    AppNavigator.push(const SearchScreen());
                  },
                  child: SizedBox(
                    height: 40,
                    child: TextField(
                      enabled: false,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColors.borderColor,
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
                        ),
                        disabledBorder: border,
                      ),
                    ),
                  ),
                ),
                8.h,
                Row(
                  children: [
                    const CustomIcon(AppIcons.location),
                    8.w,
                    Text(
                      'Deliver to - tirunelveli 627003',
                      style: context.bodySmall?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                10.h,
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              // Carousel
              const CarouselWireframe(),
              15.h,
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: HomeTabChips(),
              ),
              20.h,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: HomeProducts(titles: chips, isWireframe: true),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
