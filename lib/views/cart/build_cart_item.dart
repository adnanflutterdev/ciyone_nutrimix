import 'package:ciyone_nutrimix/core/constants/app_colors.dart';
import 'package:ciyone_nutrimix/core/constants/app_icons.dart';
import 'package:ciyone_nutrimix/core/utils/app_navigator.dart';
import 'package:ciyone_nutrimix/core/utils/sized_box_extension.dart';
import 'package:ciyone_nutrimix/core/utils/theme_extension.dart';
import 'package:ciyone_nutrimix/models/cart_model.dart';
import 'package:ciyone_nutrimix/models/product_model.dart';
import 'package:ciyone_nutrimix/views/cart/cart_function.dart';
import 'package:ciyone_nutrimix/views/providers/cart_provider.dart';
import 'package:ciyone_nutrimix/views/widgets/build_product_details.dart';
import 'package:ciyone_nutrimix/views/widgets/buttons.dart';
import 'package:ciyone_nutrimix/views/widgets/custom_alert_dialog.dart';
import 'package:ciyone_nutrimix/views/widgets/custom_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BuildCartItem extends ConsumerWidget {
  const BuildCartItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void productRemoveDialog(String docId) {
      customAlertDialog(
        context,
        title: 'Remove product from cart',
        content: 'Are you sure to remove this product from your cart',
        action: 'Remove',
        actionFunction: () async {
          await removeFromCart(context, docId: docId);
          AppNavigator.pop();
        },
      );
    }

    final cart = ref.watch(cartProvider);
    final cartProducts = ref.watch(cartProductsProvider);

    return cart.when(
      data: (cart) {
        if (cart.isEmpty) {
          return const Center(child: Text('Your Cart Is Empty...'));
        }
        return ListView.builder(
          itemCount: cartProducts.length,
          itemBuilder: (context, index) {
            CartModel cartItem = cart[index];
            Product product = cartProducts[index];
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical: 8,
              ),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.borderColor),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: BuildProductDetails(
                        product: product,
                        varientIndex: cartItem.varientIndex,
                        showRating: false,
                        icon: null,
                      ),
                    ),
                    5.h,
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15.0,
                        vertical: 5,
                      ),
                      child: Row(
                        children: [
                          CustomIcon(
                            AppIcons.minusSquare,
                            size: 18,
                            horzontalPadding: 8,
                            verticalPadding: 4,
                            onPressed: cartItem.quantity > 1
                                ? () async {
                                    await updateQuantity(
                                      context,
                                      docId: cartItem.docId,
                                      quantity: cartItem.quantity - 1,
                                    );
                                  }
                                : () => productRemoveDialog(cartItem.docId),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 3,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.borderColor,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text('${cartItem.quantity}'),
                          ),
                          CustomIcon(
                            AppIcons.addSquare,
                            size: 18,
                            horzontalPadding: 8,
                            verticalPadding: 4,
                            onPressed: () async {
                              await updateQuantity(
                                context,
                                docId: cartItem.docId,
                                quantity: cartItem.quantity + 1,
                              );
                            },
                          ),
                          const Spacer(),
                          SizedBox(
                            height: 35,
                            child: PrimaryButton(
                              label: 'Remove',
                              onPressed: () =>
                                  productRemoveDialog(cartItem.docId),
                              fontSize: 12,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              color: AppColors.highlightTextColor,
                              borderRadius: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                    10.h,
                    Container(
                      height: 36,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: AppColors.stepperActiveColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(6),
                          bottomRight: Radius.circular(6),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'You are saving ₹${product.pricing.mrp - product.pricing.price} on this purchase',
                          style: context.bodyMedium?.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      error: (error, stackTrace) =>
          const Center(child: Text('Failed to fetch cart')),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
