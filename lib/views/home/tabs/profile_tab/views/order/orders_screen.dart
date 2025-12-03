import 'package:cached_network_image/cached_network_image.dart';
import 'package:ciyone_nutrimix/core/constants/app_colors.dart';
import 'package:ciyone_nutrimix/core/constants/app_icons.dart';
import 'package:ciyone_nutrimix/core/utils/app_navigator.dart';
import 'package:ciyone_nutrimix/core/utils/screen_size.dart';
import 'package:ciyone_nutrimix/core/utils/sized_box_extension.dart';
import 'package:ciyone_nutrimix/core/utils/theme_extension.dart';
import 'package:ciyone_nutrimix/models/new_product_model.dart';
import 'package:ciyone_nutrimix/models/order_model.dart';
import 'package:ciyone_nutrimix/views/home/tabs/profile_tab/views/order/customer_support.dart';
import 'package:ciyone_nutrimix/views/home/tabs/profile_tab/views/order/order_details.dart';
import 'package:ciyone_nutrimix/views/providers/my_orders_provider.dart';
import 'package:ciyone_nutrimix/views/widgets/custom_app_bar.dart';
import 'package:ciyone_nutrimix/views/widgets/custom_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    return Expanded(
      child: Padding(
        padding: const EdgeInsetsGeometry.all(15),
        child: Consumer(
          builder: (context, ref, child) {
            final myOrders = ref.watch(myOrdersProvider);

            final orderedProducts = ref.watch(getOrderedProducts);
            return myOrders.when(
              data: (orders) {
                if (orders.isEmpty) {
                  return const Center(child: Text('No Orders Yet'));
                }
                return ListView.builder(
                  itemCount: orderedProducts.length,
                  itemBuilder: (context, index) {
                    OrderStatus orderStatus = orders[index].orderStatus;
                    NewProductModel newProduct = orderedProducts[index][0];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: GestureDetector(
                        onTap: () {
                          AppNavigator.push(OrderDetails(orderIndex: index));
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
                                    crossAxisAlignment: .start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'Order ID',
                                            style: context.bodyMedium?.copyWith(
                                              color:
                                                  AppColors.secondaryTextColor,
                                            ),
                                          ),
                                          const Spacer(),
                                          Text(
                                            orderStatus.orderDate,
                                            style: context.bodyMedium?.copyWith(
                                              color:
                                                  AppColors.secondaryTextColor,
                                            ),
                                          ),
                                        ],
                                      ),

                                      Text(
                                        '${orders[index].id.substring(0, 8)}......${orders[index].id.substring(28, 36)}',
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              _buildProductDetails(
                                context,
                                product: newProduct,
                                noOfProducts: orderedProducts[index].length,
                                varientIndex:
                                    orders[index].cart[0].varientIndex,
                              ),
                              _buildStatusChip(
                                context,
                                orderStatus: orderStatus,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              error: (error, stackTrace) => const SizedBox.shrink(),
              loading: () => const Center(child: CircularProgressIndicator()),
            );
          },
        ),
      ),
    );
  }

  Widget _buildProductDetails(
    BuildContext context, {
    required NewProductModel product,
    required int varientIndex,
    required int noOfProducts,
  }) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl: product.varientImages[varientIndex].images[0],
            width: 92,
            height: 92,
            placeholder: (context, url) => const Center(
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(),
              ),
            ),
          ),
          20.w,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.title, style: context.bodyMedium),
                RichText(
                  text: TextSpan(
                    text: product.currentVarient.value,
                    style: context.bodySmall?.copyWith(
                      color: AppColors.secondaryTextColor,
                    ),
                    children: [
                      const TextSpan(text: ' '),
                      TextSpan(text: product.varientImages[0].value),
                    ],
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
                    15.w,
                    if (noOfProducts > 1)
                      Text(
                        '+${noOfProducts - 1}',
                        style: context.bodyLarge?.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusChip(
    BuildContext context, {
    required OrderStatus orderStatus,
  }) {
    String label = 'Ordered';
    Color chipColor = AppColors.secondaryChipColor;
    Color textColor = AppColors.secondaryChipTextColor;

    if (orderStatus.cancelled) {
      label = 'Cancelled';
      chipColor = AppColors.highlightTextColor.withValues(alpha: 0.3);
      textColor = AppColors.error;
    } else if (orderStatus.delivered) {
      label = 'Delivered';
      chipColor = AppColors.primary.withValues(alpha: 0.3);
      textColor = AppColors.primary;
    } else if (orderStatus.shipped) {
      label = 'Shipped';
      chipColor = AppColors.tertiaryChipColor;
      textColor = AppColors.tertiaryChipTextColor;
    } else if (orderStatus.packaged) {
      label = 'Packaged';
      chipColor = AppColors.chipColor;
      textColor = AppColors.hintTextColor;
    }

    return Row(
      mainAxisAlignment: .end,
      children: [
        Container(
          decoration: BoxDecoration(
            color: chipColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(6),
              bottomRight: Radius.circular(6),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Text(
            label,
            style: context.bodySmall?.copyWith(
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
          ),
        ),
      ],
    );
  }
}
