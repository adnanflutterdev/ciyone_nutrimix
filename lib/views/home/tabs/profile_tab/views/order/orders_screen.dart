import 'package:ciyone_nutrimix/core/constants/app_colors.dart';
import 'package:ciyone_nutrimix/core/constants/app_icons.dart';
import 'package:ciyone_nutrimix/core/utils/app_navigator.dart';
import 'package:ciyone_nutrimix/core/utils/screen_size.dart';
import 'package:ciyone_nutrimix/core/utils/sized_box_extension.dart';
import 'package:ciyone_nutrimix/core/utils/theme_extension.dart';
import 'package:ciyone_nutrimix/dummy_data/products.dart';
import 'package:ciyone_nutrimix/models/product_model.dart';
import 'package:ciyone_nutrimix/views/home/tabs/profile_tab/views/order/customer_support.dart';
import 'package:ciyone_nutrimix/views/home/tabs/profile_tab/views/order/order_details.dart';
import 'package:ciyone_nutrimix/views/widgets/custom_app_bar.dart';
import 'package:ciyone_nutrimix/views/widgets/custom_icon.dart';
import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Orders',
        actions: [
          GestureDetector(
            onTap: () {
              AppNavigator.push(const CustomerSupport());
            },
            child: Row(
              children: [
                Text(
                  'Help',
                  style: context.titleSmall?.copyWith(
                    color: AppColors.secondaryTextColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                10.w,
                const CustomIcon(
                  AppIcons.ask,
                  size: 22,
                  color: AppColors.secondaryIconColor,
                ),
              ],
            ),
          ),
          15.w,
        ],
      ),
      body: Column(
        children: [_buildSearchBar(context), 20.h, _buildOrders(context)],
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    void showSortMenu(Offset position) async {
      showMenu(
        position: .fromLTRB(
          position.dx - 100,
          position.dy,
          0,
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
          const PopupMenuItem(height: 35, child: Text('Recent')),
          const PopupMenuItem(height: 35, child: Text('Oldest')),
        ],
      );
    }

    return Container(
      color: AppColors.primary,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),

                  filled: true,
                  fillColor: AppColors.white,
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
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: const BorderSide(color: AppColors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: const BorderSide(color: AppColors.white),
                  ),
                ),
              ),
            ),
            15.w,
            CustomIcon(
              AppIcons.sort,
              color: AppColors.white,
              size: 24,
              onTapDown: (details) {
                showSortMenu(details.globalPosition);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrders(BuildContext context) {
    List<String> labels = ['Ordered', 'Shipped'];
    return Expanded(
      child: Padding(
        padding: const EdgeInsetsGeometry.all(15),
        child: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) {
            ProductModel product = dummyProducts[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: GestureDetector(
                onTap: () {
                  AppNavigator.push(OrderDetails(product: product));
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.borderColor),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Column(
                    children: [
                      Container(
                        color: AppColors.borderColor,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Order ID',
                                    style: context.bodyMedium?.copyWith(
                                      color: AppColors.secondaryTextColor,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    'Tue, 21 Feb 2025',
                                    style: context.bodyMedium?.copyWith(
                                      color: AppColors.secondaryTextColor,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text('Hka-48338-71309388'),
                                  const Spacer(),
                                  Text('₹${product.price}'),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            Image.asset(product.image, height: 85),
                            20.w,
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.title,
                                    style: context.bodyMedium,
                                  ),
                                  Text(
                                    product.subTitle ?? '',
                                    style: context.bodySmall?.copyWith(
                                      color: AppColors.secondaryTextColor,
                                    ),
                                  ),
                                  10.h,
                                  Row(
                                    children: [
                                      Text(
                                        'View Details',
                                        style: context.bodyMedium?.copyWith(
                                          color: AppColors.highlightTextColor,
                                        ),
                                      ),
                                      10.w,
                                      const CustomIcon(
                                        AppIcons.arrowCircleRight,
                                        size: 14,
                                        color: AppColors.highlightTextColor,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: .end,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: index % 2 == 0
                                  ? AppColors.secondaryChipColor
                                  : AppColors.tertiaryChipColor,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(6),
                                bottomRight: Radius.circular(6),
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 5,
                            ),
                            child: Text(
                              labels[index],
                              style: context.bodySmall?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: index % 2 == 0
                                    ? AppColors.secondaryChipTextColor
                                    : AppColors.tertiaryChipTextColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
