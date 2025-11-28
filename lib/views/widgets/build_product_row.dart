import 'package:cached_network_image/cached_network_image.dart';
import 'package:ciyone_nutrimix/models/new_product_model.dart';
import 'package:ciyone_nutrimix/views/home/tabs/home_tab/wire_frame/build_product_row_wireframe.dart';
import 'package:ciyone_nutrimix/views/widgets/heart_button.dart';
import 'package:flutter/material.dart';
import 'package:ciyone_nutrimix/core/constants/app_colors.dart';
import 'package:ciyone_nutrimix/core/constants/app_icons.dart';
import 'package:ciyone_nutrimix/core/utils/app_navigator.dart';
import 'package:ciyone_nutrimix/core/utils/sized_box_extension.dart';
import 'package:ciyone_nutrimix/core/utils/theme_extension.dart';
import 'package:ciyone_nutrimix/models/cart_model.dart';
import 'package:ciyone_nutrimix/views/cart/cart_function.dart';
import 'package:ciyone_nutrimix/views/cart/cart_screen.dart';
import 'package:ciyone_nutrimix/views/product/product_detail_screen.dart';
import 'package:ciyone_nutrimix/views/product/view_all_products.dart';
import 'package:ciyone_nutrimix/views/providers/my_details_provider.dart';
import 'package:ciyone_nutrimix/views/providers/products_provider.dart';
import 'package:ciyone_nutrimix/views/widgets/buttons.dart';
import 'package:ciyone_nutrimix/views/widgets/custom_icon.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BuildProductRow extends ConsumerWidget {
  const BuildProductRow({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productsProvider);
    return products.when(
      data: (products) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(title, style: context.titleSmall),
                const Spacer(),
                TextButton.icon(
                  onPressed: () {
                    AppNavigator.push(
                      ViewAllProducts(title: title, products: products),
                    );
                  },
                  icon: const CustomIcon(
                    AppIcons.arrowCircleRight,
                    color: AppColors.secondaryIconColor,
                  ),
                  style: TextButton.styleFrom(),
                  iconAlignment: IconAlignment.end,
                  label: Text(
                    'View All ',
                    style: context.bodyLarge?.copyWith(
                      color: AppColors.secondaryTextColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 275,
              child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  NewProductModel product = products[index];
                  // final off =
                  //     ((product.discount * 100) /
                  //             (product.price + product.discount))
                  //         .ceil();
                  return Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: GestureDetector(
                      onTap: () {
                        AppNavigator.push(
                          ProductDetailScreen(product: product),
                        );
                      },
                      child: Container(
                        width: 190,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: AppColors.borderColor),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Consumer(
                            builder: (context, ref, child) {
                              final myDetails = ref.watch(myDetailsProvider);

                              return myDetails.when(
                                data: (data) {
                                  List<CartModel> cart = data.cart;
                                  bool isInCart = cart.any(
                                    (element) =>
                                        element.productId == product.id,
                                  );
                                  String image =
                                      product.varientImages[0].images[0];
                                  // print(image);
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: HeartButton(
                                          productId: product.id,
                                        ),
                                      ),
                                      const Spacer(flex: 2),
                                      Center(
                                        child: CachedNetworkImage(
                                          imageUrl: image,
                                          width: 92,
                                          height: 92,
                                          placeholder: (context, url) =>
                                              const SizedBox(
                                                width: 20,
                                                height: 20,
                                                child:
                                                    CircularProgressIndicator(),
                                              ),
                                        ),
                                      ),
                                      const Spacer(flex: 2),
                                      Text(
                                        '${product.title}, ${product.currentVarient.value}',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: context.bodyMedium,
                                      ),
                                      const Spacer(flex: 1),
                                      Row(
                                        children: [
                                          Text(
                                            '₹${product.pricing.price} ',
                                            style: context.bodyLarge,
                                          ),
                                          Text(
                                            ' ₹${product.pricing.mrp} ',
                                            style: context.bodyMedium?.copyWith(
                                              color:
                                                  AppColors.secondaryTextColor,
                                              decoration:
                                                  TextDecoration.lineThrough,
                                            ),
                                          ),
                                          const Spacer(),
                                          Expanded(
                                            child: Text(
                                              '${product.pricing.discountPercentage}% off',
                                              style: context.bodySmall
                                                  ?.copyWith(
                                                    color: AppColors
                                                        .highlightTextColor,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Spacer(flex: 1),
                                      Row(
                                        children: [
                                          Text(
                                            '${product.rating.average}',
                                            style: context.bodySmall?.copyWith(
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          6.w,
                                          RatingBar.builder(
                                            initialRating:
                                                product.rating.average,
                                            itemSize: 12,
                                            allowHalfRating: true,
                                            itemPadding:
                                                const EdgeInsetsGeometry.only(
                                                  right: 5,
                                                ),
                                            ignoreGestures: true,
                                            itemBuilder: (context, index) {
                                              return const CustomIcon(
                                                AppIcons.starFilled,
                                                color: AppColors.ratingColor,
                                              );
                                            },
                                            onRatingUpdate: (rating) {},
                                          ),
                                        ],
                                      ),
                                      const Spacer(flex: 2),
                                      PrimaryButton(
                                        label:
                                            '${isInCart ? 'Go' : 'Add'} To Cart',
                                        color: isInCart
                                            ? AppColors.primaryIconColor
                                            : AppColors.primary,
                                        onPressed: isInCart
                                            ? () {
                                                AppNavigator.push(
                                                  const CartScreen(),
                                                );
                                              }
                                            : () async {
                                                await addToCart(
                                                  context,
                                                  product.id,
                                                );
                                              },
                                        fontSize: 14,
                                        height: 32,
                                        borderRadius: 6,
                                      ),
                                    ],
                                  );
                                },
                                error: (error, stackTrace) {
                                  print(error);
                                  print(stackTrace);
                                  return const Text('Error occured');
                                },
                                loading: () => const Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
      error: (error, stackTrace) {
        print(error);
        print(stackTrace);
        return const Text('Error occured...');
      },
      loading: () => const BuildProductRowWireframe(),
    );
  }
}
