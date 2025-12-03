import 'package:cached_network_image/cached_network_image.dart';
import 'package:ciyone_nutrimix/core/constants/app_colors.dart';
import 'package:ciyone_nutrimix/core/constants/app_icons.dart';
import 'package:ciyone_nutrimix/core/utils/app_navigator.dart';
import 'package:ciyone_nutrimix/core/utils/sized_box_extension.dart';
import 'package:ciyone_nutrimix/core/utils/theme_extension.dart';
import 'package:ciyone_nutrimix/models/cart_model.dart';
import 'package:ciyone_nutrimix/models/product_model.dart';
import 'package:ciyone_nutrimix/models/order_model.dart';
import 'package:ciyone_nutrimix/views/home/tabs/profile_tab/views/address/address_screen.dart';
import 'package:ciyone_nutrimix/views/home/tabs/profile_tab/views/order/cancel_order.dart';
import 'package:ciyone_nutrimix/views/home/tabs/profile_tab/views/order/customer_support.dart';
import 'package:ciyone_nutrimix/views/home/tabs/profile_tab/views/order/summary_details.dart';
import 'package:ciyone_nutrimix/views/providers/my_orders_provider.dart';
import 'package:ciyone_nutrimix/views/widgets/buttons.dart';
import 'package:ciyone_nutrimix/views/widgets/custom_app_bar.dart';
import 'package:ciyone_nutrimix/views/widgets/custom_icon.dart';
import 'package:ciyone_nutrimix/views/widgets/custom_text_field.dart';
import 'package:ciyone_nutrimix/views/widgets/expand_toggler.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key, required this.orderIndex});

  final int orderIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'View Order Details',
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
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Consumer(
          builder: (context, ref, child) {
            final myOrders = ref.watch(myOrdersProvider);
            final products = ref.watch(getOrderedProducts)[orderIndex];
            return myOrders.when(
              data: (orders) {
                OrderModel order = orders[orderIndex];
                OrderStatus orderStatus = order.orderStatus;
                int stepperIndex = 0;
                if (orderStatus.delivered) {
                  stepperIndex = 3;
                } else if (orderStatus.shipped) {
                  stepperIndex = 2;
                } else if (orderStatus.packaged) {
                  stepperIndex = 1;
                }
                List<Map> labels = [
                  {'title': 'Ordered', 'subtitle': orderStatus.orderDate},
                  {
                    'title': 'Packaged',
                    'subtitle': stepperIndex < 1
                        ? 'We will notify you once your package is ready'
                        : 'Your order is packaged and soon will be shipped',
                  },
                  {
                    'title': 'Shipped',
                    'subtitle': stepperIndex < 2
                        ? 'This process is not done yet'
                        : 'Your order is shipped and soon will be out for delivery',
                  },
                  {
                    'title': 'Delivered',
                    'subtitle': stepperIndex < 3
                        ? 'Expected delivery by : ${orderStatus.deliveryDate}'
                        : 'Your order is delivered',
                  },
                ];

                return Column(
                  children: [
                    if (orderStatus.cancelled) ...[
                      Text(
                        'Cancelled',
                        style: context.titleSmall?.copyWith(
                          color: AppColors.highlightTextColor,
                        ),
                      ),
                      Text('Reason: ${order.reason!}'),
                      20.h,
                    ],
                    Expanded(
                      child: ColorFiltered(
                        colorFilter: .mode(
                          orderStatus.cancelled
                              ? AppColors.white.withValues(alpha: 0.4)
                              : Colors.transparent,
                          .srcATop,
                        ),
                        child: ListView(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 15.0),
                              child: GestureDetector(
                                onTap: () {},
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: AppColors.borderColor,
                                    ),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: .start,
                                    children: [
                                      Container(
                                        color: AppColors.borderColor,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment: .start,
                                            children: [
                                              Text(
                                                'Order ID',
                                                style: context.bodyLarge
                                                    ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                              ),

                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      order.id,
                                                      style: context.bodyMedium,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: products.length,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          Product product = products[index];
                                          CartModel cartItem =
                                              order.cart[index];
                                          VarientImages varientImages =
                                              product.varientImages[cartItem
                                                  .varientIndex];
                                          return Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Row(
                                              children: [
                                                CachedNetworkImage(
                                                  imageUrl:
                                                      varientImages.images[0],
                                                  width: 80,
                                                  height: 80,
                                                  placeholder: (context, url) =>
                                                      const Center(
                                                        child: SizedBox(
                                                          width: 20,
                                                          height: 20,
                                                          child:
                                                              CircularProgressIndicator(),
                                                        ),
                                                      ),
                                                ),
                                                20.w,
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        product.title,
                                                        style:
                                                            context.bodyMedium,
                                                      ),
                                                      Text(
                                                        '${product.currentVarient.value} ${varientImages.value}',
                                                        style: context.bodySmall
                                                            ?.copyWith(
                                                              color: AppColors
                                                                  .secondaryTextColor,
                                                            ),
                                                      ),
                                                      10.h,
                                                      Text(
                                                        '₹${product.pricing.price}',
                                                        style:
                                                            context.titleSmall,
                                                      ),
                                                      if (cartItem.quantity > 1)
                                                        Text(
                                                          '${cartItem.quantity}x',
                                                          style: context
                                                              .bodyMedium
                                                              ?.copyWith(
                                                                color: AppColors
                                                                    .secondaryTextColor,
                                                              ),
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            30.h,
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: labels.length,
                              itemBuilder: (context, index) {
                                return _buildTrack(
                                  context,
                                  label: labels[index],
                                  index: index,
                                  stepperIndex: stepperIndex,
                                );
                              },
                            ),
                            30.h,
                            Text('Payment By', style: context.bodyLarge),
                            10.h,

                            if (order.paymentMethod == 'Cash on Delivery')
                              SummaryDetails(
                                products: products,
                                quantityList: order.cart
                                    .map((cart) => cart.quantity)
                                    .toList(),
                              )
                            else
                              ExpandToggler(
                                title: 'Already paid via: ',
                                value: order.paymentMethod,
                              ),
                            30.h,
                            Row(
                              children: [
                                Text(
                                  'Delivery Address',
                                  style: context.bodyLarge,
                                ),
                                const Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    AppNavigator.push(const AddressScreen());
                                  },
                                  child: Text(
                                    'Change',
                                    style: context.bodyMedium?.copyWith(
                                      color: AppColors.highlightTextColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            10.h,
                            const CustomTextField(
                              readOnly: true,
                              maxLines: 3,
                              hintText:
                                  'Ground floor, Teepeyem Enclave, Kaloor - Kadavanthara Rd, opp. Gokul Oottupura, Kochi, Kerala 682020',
                            ),
                            45.h,
                            if (!orderStatus.cancelled)
                              PrimaryButton(
                                label: 'Cancel Order',
                                onPressed: () {
                                  AppNavigator.push(
                                    CancelOrder(docId: order.docId),
                                  );
                                },
                                borderButton: true,
                                borderRadius: 6,
                                fontSize: 14,
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
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

  Widget _buildTrack(
    BuildContext context, {
    required Map label,
    required int index,
    required int stepperIndex,
  }) {
    return Row(
      crossAxisAlignment: .start,
      children: [
        Column(
          children: [
            CustomIcon(
              stepperIndex == index
                  ? AppIcons.activeCircle
                  : stepperIndex > index
                  ? AppIcons.tickCircle
                  : AppIcons.untickCircle,
              size: 21,
              color: index <= stepperIndex
                  ? AppColors.stepperActiveColor
                  : AppColors.secondaryIconColor,
            ),
            if (index != 3)
              const DottedLine(
                lineLength: 60,
                direction: Axis.vertical,
                dashColor: AppColors.secondaryIconColor,
              ),
          ],
        ),
        16.w,
        Expanded(
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Text(label['title'], style: context.titleSmall),
              Text(
                label['subtitle'],
                style: context.bodyLarge?.copyWith(
                  color: AppColors.secondaryTextColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
