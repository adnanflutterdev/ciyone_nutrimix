import 'package:ciyone_nutrimix/core/constants/app_colors.dart';
import 'package:ciyone_nutrimix/core/constants/app_icons.dart';
import 'package:ciyone_nutrimix/core/constants/text_field_border.dart';
import 'package:ciyone_nutrimix/core/global_notifier/filter_and_sort_notifier.dart';
import 'package:ciyone_nutrimix/core/utils/app_navigator.dart';
import 'package:ciyone_nutrimix/core/utils/screen_size.dart';
import 'package:ciyone_nutrimix/core/utils/sized_box_extension.dart';
import 'package:ciyone_nutrimix/core/utils/theme_extension.dart';
import 'package:ciyone_nutrimix/models/product_model.dart';
import 'package:ciyone_nutrimix/views/cart/cart_screen.dart';
import 'package:ciyone_nutrimix/views/home/tabs/explore_tab/filter_screen.dart';
import 'package:ciyone_nutrimix/views/widgets/build_products.dart';
import 'package:ciyone_nutrimix/views/widgets/custom_icon.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  void showSortMenu(Offset position) {
    showMenu(
      position: .fromLTRB(
        0,
        position.dy + 20,
        position.dx - 100,
        ScreenSize.height - position.dy - 100,
      ),
      context: context,
      menuPadding: const EdgeInsets.symmetric(vertical: 8),
      color: AppColors.white,
      items: <PopupMenuEntry>[
        PopupMenuItem(
          height: 35,
          child: Row(
            children: [
              Text(
                'Sort by',
                style: context.bodyMedium?.copyWith(
                  color: AppColors.secondaryTextColor,
                ),
              ),
              const Spacer(),
              const CustomIcon(AppIcons.closeSquare, size: 12),
            ],
          ),
        ),
        const PopupMenuDivider(height: 1),
        const PopupMenuItem(height: 35, child: Text('Popularity')),
        PopupMenuItem(
          height: 35,
          child: const Text('Price - low to high'),
          onTap: () => priceLowToHigh(),
        ),
        PopupMenuItem(
          height: 35,
          child: const Text('Price - High to low'),
          onTap: () => priceHighToLow(),
        ),
        PopupMenuItem(
          height: 35,
          child: const Text('Discount'),
          onTap: () => discount(),
        ),
        PopupMenuItem(
          height: 35,
          child: const Text('Rating'),
          onTap: () => rating(),
        ),
      ],
    );
  }

  void priceLowToHigh() {
    List<Product> currentList = [...allProducts.value];
    currentList.sort((a, b) => a.pricing.price.compareTo(b.pricing.price));
    allProducts.value = currentList;
  }

  void priceHighToLow() {
    List<Product> currentList = [...allProducts.value];
    currentList.sort((a, b) => b.pricing.price.compareTo(a.pricing.price));
    allProducts.value = currentList;
  }

  void discount() {
    List<Product> currentList = [...allProducts.value];
    currentList.sort(
      (a, b) =>
          b.pricing.discountPercentage.compareTo(a.pricing.discountPercentage),
    );
    allProducts.value = currentList;
  }

  void rating() {
    List<Product> currentList = [...allProducts.value];
    currentList.sort((a, b) => b.rating.ratings.compareTo(a.rating.ratings));
    allProducts.value = currentList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 1, backgroundColor: AppColors.primary),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
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
                        enabledBorder: border,
                        focusedBorder: border,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTapDown: (details) => showSortMenu(details.globalPosition),
                  child: Row(
                    children: [
                      const CustomIcon(AppIcons.sort, size: 24),
                      12.w,
                      Text('Sort By', style: context.bodyLarge),
                    ],
                  ),
                ),
                const RotatedBox(
                  quarterTurns: 1,
                  child: SizedBox(width: 30, child: Divider()),
                ),
                GestureDetector(
                  onTap: () {
                    AppNavigator.push(const FilterScreen());
                  },
                  child: Row(
                    children: [
                      const CustomIcon(AppIcons.filterSearch, size: 24),
                      12.w,
                      Text('Filter', style: context.bodyLarge),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(color: AppColors.borderStrokeColor),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    10.h,
                    Text('Why muscleblaze?', style: context.titleMedium),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15.0,
                        vertical: 8,
                      ),
                      child: Text(
                        'MuscleBlaze is one of the best selling brands in india when it comes to healthy, top quality and reasonable supplements. from whey protein, mass gainers, bcaa’s to raw whey protein, muscleblaze has everything to',
                        style: context.bodyLarge?.copyWith(
                          color: AppColors.secondaryTextColor,
                          fontWeight: FontWeight.normal,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: const CustomIcon(
                        AppIcons.arrowCircleDown,
                        color: AppColors.primary,
                      ),
                      style: TextButton.styleFrom(),
                      iconAlignment: IconAlignment.end,
                      label: Text(
                        'Read More',
                        style: context.bodyLarge?.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: ValueListenableBuilder(
                        valueListenable: allProducts,
                        builder: (context, products, child) {
                          return BuildProducts(
                            products: products,
                            shrinkWrap: true,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
