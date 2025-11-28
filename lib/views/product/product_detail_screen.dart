import 'package:ciyone_nutrimix/core/constants/app_colors.dart';
import 'package:ciyone_nutrimix/core/constants/app_icons.dart';
import 'package:ciyone_nutrimix/core/utils/app_navigator.dart';
import 'package:ciyone_nutrimix/core/utils/screen_size.dart';
import 'package:ciyone_nutrimix/core/utils/sized_box_extension.dart';
import 'package:ciyone_nutrimix/core/utils/theme_extension.dart';
import 'package:ciyone_nutrimix/models/cart_model.dart';
import 'package:ciyone_nutrimix/models/new_product_model.dart';
import 'package:ciyone_nutrimix/views/cart/cart_function.dart';
import 'package:ciyone_nutrimix/views/cart/cart_screen.dart';
import 'package:ciyone_nutrimix/views/home/tabs/profile_tab/views/address/add_new_address.dart';
import 'package:ciyone_nutrimix/views/product/product_varient_images.dart';
import 'package:ciyone_nutrimix/views/providers/my_details_provider.dart';
import 'package:ciyone_nutrimix/views/purchase/purchase_screen.dart';
import 'package:ciyone_nutrimix/views/home/tabs/home_tab/widgets/home_products.dart';
import 'package:ciyone_nutrimix/views/product/product_image_slider.dart';
import 'package:ciyone_nutrimix/views/widgets/bordered_container.dart';
import 'package:ciyone_nutrimix/views/widgets/build_delivery_details.dart';
import 'package:ciyone_nutrimix/views/widgets/custom_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key, required this.product});
  final NewProductModel product;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final ValueNotifier<int> productVarientIndex = ValueNotifier(0);
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

        actions: [
          const CustomIcon(AppIcons.search, size: 22),
          20.w,
          CustomIcon(
            AppIcons.cart,
            size: 22,
            onPressed: () {
              AppNavigator.push(const CartScreen());
            },
          ),
          15.w,
        ],
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: AppColors.borderStrokeColor.withValues(alpha: 0.6),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView(
            children: [
              buildDeliveryDetail(context),
              15.h,
              ValueListenableBuilder(
                valueListenable: productVarientIndex,
                builder: (context, varientIndex, child) {
                  return ProductImageSlider(
                    images: [
                      ...widget.product.varientImages[varientIndex].images,
                      ...widget.product.baseImages ?? [],
                    ],
                    productId: widget.product.id,
                  );
                },
              ),
              15.h,
              _buildProductDetails(context, product: widget.product),
              30.h,
              _buildVariant(context, product: widget.product),
              20.h,
              _buildDeliveryAndServices(context),
              20.h,
              _buildOffers(context),
              20.h,
              _buildOverView(context),
              20.h,
              _buildDetails(context),
              20.h,
              _buildCustomerReviews(context, product: widget.product),
              20.h,
              const HomeProducts(titles: ['Similar Products']),
              20.h,
              _buildSellerInfo(context),
            ],
          ),
        ),
      ),

      // Bottom Buttons
      bottomNavigationBar: SafeArea(
        child: Container(
          height: 60,
          decoration: const BoxDecoration(
            border: Border(top: BorderSide(color: AppColors.borderStrokeColor)),
          ),
          child: Row(
            children: [
              Consumer(
                builder: (context, ref, child) {
                  final myDetails = ref.watch(myDetailsProvider);
                  return myDetails.when(
                    error: (error, stackTrace) => Text(
                      'Add to Cart',
                      style: context.bodyLarge?.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                    loading: () => Text(
                      'Add to Cart',
                      style: context.bodyLarge?.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                    data: (data) {
                      List<CartModel> cart = data.cart;
                      bool isInCart = cart.any(
                        (element) => element.productId == widget.product.id,
                      );
                      return GestureDetector(
                        onTap: isInCart
                            ? () {
                                AppNavigator.push(const CartScreen());
                              }
                            : () async {
                                await addToCart(context, widget.product.id);
                              },
                        child: SizedBox(
                          width: ScreenSize.width / 2,
                          child: Center(
                            child: Text(
                              '${isInCart ? 'Go' : 'Add'} to Cart',
                              style: context.bodyLarge?.copyWith(
                                color: isInCart
                                    ? AppColors.primaryTextColor
                                    : AppColors.primary,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
              GestureDetector(
                onTap: () {
                  AppNavigator.push(PurchaseScreen(product: widget.product));
                },
                child: Container(
                  color: AppColors.primary,
                  width: ScreenSize.width / 2,
                  child: Center(
                    child: Text(
                      'Buy Now',
                      style: context.bodyLarge?.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductDetails(
    BuildContext context, {
    required NewProductModel product,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${product.title}, ${product.currentVarient.label} ${product.currentVarient.value}',
          style: context.titleSmall?.copyWith(fontWeight: FontWeight.normal),
        ),
        Row(
          children: [
            Text('₹${product.pricing.price} ', style: context.titleLarge),
            Text(
              ' ₹${product.pricing.mrp}',
              style: context.bodyLarge?.copyWith(
                color: AppColors.secondaryTextColor,
                decoration: TextDecoration.lineThrough,
                decorationColor: AppColors.borderStrokeColor,
                decorationThickness: 2,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(flex: 4),
            Text(
              '${product.pricing.discountPercentage}% off',
              style: context.bodySmall?.copyWith(
                color: AppColors.highlightTextColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
          ],
        ),
        Text('Inclusive all taxes', style: context.bodySmall),
        5.h,
        Row(
          children: [
            Text(
              '${product.rating.average}',
              style: context.bodySmall?.copyWith(fontWeight: FontWeight.w600),
            ),
            6.w,
            RatingBar.builder(
              initialRating: product.rating.average,
              itemSize: 12,
              allowHalfRating: true,
              itemPadding: const EdgeInsetsGeometry.only(right: 5),
              ignoreGestures: true,
              itemBuilder: (context, index) {
                return const CustomIcon(
                  AppIcons.starFilled,
                  color: AppColors.ratingColor,
                );
              },
              onRatingUpdate: (rating) {},
            ),
            8.w,
            if (product.rating.average > 4.4)
              Expanded(
                child: Text(
                  '(${product.rating.ratings} rating)',
                  style: context.bodySmall?.copyWith(fontSize: 8),
                ),
              ),
          ],
        ),
      ],
    );
  }

  Widget _buildVariant(
    BuildContext context, {
    required NewProductModel product,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Select Variant', style: context.bodyLarge),
        8.h,
        BorderedContainer(
          child: Row(
            children: [
              Text(
                '${product.currentVarient.label}:  ',
                style: context.bodyLarge?.copyWith(
                  color: AppColors.secondaryTextColor,
                ),
              ),
              Text(
                product.currentVarient.value,
                style: context.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              const CustomIcon(AppIcons.arrowForward),
            ],
          ),
        ),
        8.h,
        ProductVarientImages(
          varientImages: product.varientImages,
          varientIndex: productVarientIndex,
        ),
      ],
    );
  }

  Widget _buildDeliveryAndServices(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Delivery & Services', style: context.bodyLarge),
        8.h,
        Container(
          decoration: BoxDecoration(
            border: BoxBorder.all(color: AppColors.borderColor),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: Row(
              children: [
                Text(
                  'Pincode:  ',
                  style: context.bodyLarge?.copyWith(
                    color: AppColors.secondaryTextColor,
                  ),
                ),
                Consumer(
                  builder: (context, ref, child) {
                    final myDetails = ref.watch(myDetailsProvider);
                    return myDetails.when(
                      data: (data) {
                        if (data.addressIndex < 0) {
                          return TextButton(
                            onPressed: () {
                              AppNavigator.push(const AddNewAddress());
                            },
                            child: const Text('Add Address'),
                          );
                        }
                        return Text(
                          data.address[data.addressIndex].pincode,
                          style: context.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        );
                      },
                      error: (error, stackTrace) => Text(
                        'ERROR',
                        style: context.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                    );
                  },
                ),
                const Spacer(),
                Text(
                  'Available',
                  style: context.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
        18.h,
        _buildIconText(
          context,
          icon: AppIcons.shipping,
          secondaryText: 'Delivery by',
          primaryText: ' Fri, 24. Free Shipping',
        ),
        _buildIconText(
          context,
          icon: AppIcons.house,
          secondaryText: 'Cash on delivery available',
        ),
        _buildIconText(
          context,
          icon: AppIcons.arrowSwapHorizontal,
          secondaryText: 'This product is non-returnable.',
        ),
      ],
    );
  }

  Widget _buildIconText(
    BuildContext context, {
    required String icon,
    required String secondaryText,
    String? primaryText,
  }) {
    return Row(
      children: [
        CustomIcon(icon, size: 14, color: AppColors.secondaryIconColor),
        8.w,
        Text(
          secondaryText,
          style: context.bodyMedium?.copyWith(
            color: AppColors.secondaryTextColor,
          ),
        ),
        if (primaryText != null)
          Text(
            primaryText,
            style: context.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
      ],
    );
  }

  Widget _buildOffers(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text('Offers', style: context.bodyLarge),
            const Spacer(),
            TextButton.icon(
              onPressed: () {},
              label: Text('+4 Offers', style: context.bodyMedium),
              iconAlignment: IconAlignment.end,
              icon: const CustomIcon(AppIcons.arrowCircleRight),
            ),
          ],
        ),
        8.h,
        _buildOfferContainer(
          context,
          title: 'Healthkart ashwaganda 60 cap @299.',
        ),
        10.h,
        _buildOfferContainer(context, title: 'Buy 1 get 1 free on mrp.'),
      ],
    );
  }

  Widget _buildOfferContainer(BuildContext context, {required String title}) {
    return Container(
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderColor),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          const CustomIcon(
            AppIcons.receiptDisscount,
            size: 20,
            color: AppColors.highlightTextColor,
          ),
          8.w,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: context.bodyMedium),
              Text(
                'Terms & Conditions',
                style: context.bodySmall?.copyWith(
                  color: AppColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.primary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOverView(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Over View',
          style: context.bodyLarge?.copyWith(
            color: AppColors.secondaryTextColor,
          ),
        ),
        8.h,
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(13),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.borderColor),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text('60 Quantity', style: context.bodyLarge),
        ),
      ],
    );
  }

  Widget _buildDetails(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Details',
          style: context.bodyLarge?.copyWith(
            color: AppColors.secondaryTextColor,
          ),
        ),
        8.h,
        _buildDetailsContainer(context, title: 'Information'),
        6.h,
        _buildDetailsContainer(context, title: 'Supplements'),
        6.h,
        _buildDetailsContainer(
          context,
          title: 'About the product',
          subtitle: 'product is near expiry date',
        ),
      ],
    );
  }

  Widget _buildDetailsContainer(
    BuildContext context, {
    required String title,
    String? subtitle,
  }) {
    return Container(
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderColor),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: context.bodyLarge),
                if (subtitle != null)
                  Text(
                    subtitle,
                    style: context.bodyMedium?.copyWith(
                      color: AppColors.secondaryTextColor,
                    ),
                  ),
              ],
            ),
          ),
          const CustomIcon(AppIcons.arrowDown),
        ],
      ),
    );
  }

  Widget _buildCustomerReviews(
    BuildContext context, {
    required NewProductModel product,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Customer Reviews',
          style: context.bodyLarge?.copyWith(
            color: AppColors.secondaryTextColor,
          ),
        ),
        8.h,
        _buildRatingContainer(context, product: product),
        18.h,
        _buildRatings(context),
      ],
    );
  }

  Widget _buildRatingContainer(
    BuildContext context, {
    required NewProductModel product,
  }) {
    return Container(
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderColor),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      '${product.rating.average} Out Of 5',
                      style: context.bodyLarge,
                    ),
                    6.w,
                    RatingBar.builder(
                      initialRating: product.rating.average,
                      itemSize: 12,
                      allowHalfRating: true,
                      itemPadding: const EdgeInsetsGeometry.only(right: 5),
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

                Text(
                  '(${product.rating.ratings} rating, 1 reviews)',
                  style: context.bodyMedium?.copyWith(
                    color: AppColors.secondaryTextColor,
                  ),
                ),
              ],
            ),
          ),
          const CustomIcon(AppIcons.arrowForward),
        ],
      ),
    );
  }

  Widget _buildRatings(BuildContext context) {
    List<int> values = [55, 11, 54, 326, 586];
    List<double> heights = [];
    double total = 0;
    for (int i in values) {
      total = total + i;
    }
    for (int i in values) {
      heights.add((i / total) * 100);
    }

    return Column(
      children: List.generate(5, (index) {
        return _buildRatingBar(
          context,
          value: values[index],
          widthPercentage: heights[index],
          index: index,
        );
      }).reversed.toList(),
    );
  }

  Widget _buildRatingBar(
    BuildContext context, {
    required int value,
    required double widthPercentage,
    required int index,
  }) {
    return Row(
      children: [
        Container(
          alignment: Alignment.centerRight,
          width: 20,
          child: Text('${index + 1}  ', style: context.bodyMedium),
        ),
        const CustomIcon(AppIcons.starFilled, size: 12),
        10.w,
        Expanded(
          child: SizedBox(
            height: 10,
            child: Stack(
              children: [
                Container(
                  height: 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.borderColor,
                  ),
                ),
                ClipPath(
                  clipper: RatingBarClipper(widthPercentage: widthPercentage),
                  child: Container(
                    height: 10,
                    decoration: BoxDecoration(
                      color: AppColors.ratingColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          width: 50,
          alignment: Alignment.centerRight,
          child: Text(
            '$value',
            style: context.bodyMedium?.copyWith(
              color: AppColors.secondaryTextColor,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSellerInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Seller Information',
          style: context.bodyLarge?.copyWith(
            color: AppColors.secondaryTextColor,
          ),
        ),
        8.h,
        Container(
          padding: const EdgeInsets.all(13),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.borderColor),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Row(
            children: [
              Expanded(
                child: RichText(
                  text: TextSpan(
                    text: 'Sold & Marked By: ',
                    style: context.bodyMedium,
                    children: [
                      TextSpan(
                        text: 'bright lifecare pvt ltd fullfilled by ',
                        style: context.bodyMedium?.copyWith(
                          color: AppColors.secondaryTextColor,
                        ),
                      ),
                      TextSpan(
                        text: 'healt kart\n',
                        style: context.bodyMedium?.copyWith(
                          color: AppColors.stepperActiveColor,
                        ),
                      ),
                      TextSpan(
                        text:
                            'parasvnath arcdia, mg road, sector-14, gurugram(haryana) - 122001',
                        style: context.bodyMedium?.copyWith(
                          color: AppColors.secondaryTextColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const CustomIcon(AppIcons.arrowForward),
            ],
          ),
        ),
      ],
    );
  }
}

class RatingBarClipper extends CustomClipper<Path> {
  final double widthPercentage;

  RatingBarClipper({super.reclip, required this.widthPercentage});
  @override
  Path getClip(Size size) {
    Path path = Path();
    double width = (widthPercentage * size.width) / 100;

    path.lineTo(width - 5, 0);
    path.cubicTo(width, 2, width, 8, width - 5, 10);
    path.lineTo(0, 10);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}
