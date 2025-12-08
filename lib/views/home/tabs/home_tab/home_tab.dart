import 'package:flutter/material.dart';
import 'package:stroke_text/stroke_text.dart';
import 'package:ciyone_nutrimix/dummy_data/chips.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ciyone_nutrimix/models/address_model.dart';
import 'package:ciyone_nutrimix/views/cart/cart_screen.dart';
import 'package:ciyone_nutrimix/core/utils/screen_size.dart';
import 'package:ciyone_nutrimix/core/utils/app_navigator.dart';
import 'package:ciyone_nutrimix/core/constants/app_icons.dart';
import 'package:ciyone_nutrimix/core/constants/app_colors.dart';
import 'package:ciyone_nutrimix/views/widgets/custom_icon.dart';
import 'package:ciyone_nutrimix/core/utils/theme_extension.dart';
import 'package:ciyone_nutrimix/core/utils/sized_box_extension.dart';
import 'package:ciyone_nutrimix/core/constants/text_field_border.dart';
import 'package:ciyone_nutrimix/views/providers/my_details_provider.dart';
import 'package:ciyone_nutrimix/views/home/tabs/home_tab/widgets/carousel.dart';
import 'package:ciyone_nutrimix/views/home/tabs/explore_tab/search_screen.dart';
import 'package:ciyone_nutrimix/views/home/tabs/home_tab/widgets/home_products.dart';
import 'package:ciyone_nutrimix/views/home/tabs/home_tab/widgets/home_tab_chips.dart';
import 'package:ciyone_nutrimix/views/home/tabs/home_tab/wire_frame/home_tab_wireframe.dart';

class HomeTab extends ConsumerStatefulWidget {
  const HomeTab({super.key});

  @override
  ConsumerState<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends ConsumerState<HomeTab>
    with AutomaticKeepAliveClientMixin {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final _ = ref.refresh(myDetailsProvider);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final myDetails = ref.watch(myDetailsProvider);
    return myDetails.when(
      data: (data) {
        AddressModel? address = data.addressIndex >= 0
            ? data.address[data.addressIndex]
            : null;
        return Column(
          children: [
            // App bar
            //
            Container(
              width: ScreenSize.width,
              color: AppColors.primary,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Expanded(
                          child: StrokeText(
                            text: 'Ciyone Nutrimix',
                            strokeColor: Colors.black54,
                            strokeWidth: 1,
                            textStyle: TextStyle(
                              letterSpacing: 1,
                              fontSize: 22,
                              color: Color(0xff07BFF2),
                              fontFamily: 'PoppinsBold',
                              shadows: [
                                Shadow(
                                  color: Color(0xff004376),
                                  blurRadius: 2,
                                  offset: Offset(1, 2),
                                ),
                              ],
                            ),
                          ),
                        ),

                        CustomIcon(
                          AppIcons.cart,
                          size: 22,
                          color: AppColors.white,
                          onPressed: () {
                            AppNavigator.push(const CartScreen());
                          },
                        ),

                        // IconButton(
                        //   onPressed: () async {
                        //     await uploadProducts();
                        //   },
                        //   icon: const Icon(Icons.upload),
                        // ),
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
                            fillColor: AppColors.white,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),

                            prefixIcon: const CustomIcon(
                              AppIcons.search,
                              size: 18,
                            ),
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
                    if (address != null)
                      Row(
                        children: [
                          const CustomIcon(
                            AppIcons.location,
                            color: AppColors.white,
                          ),
                          8.w,
                          Text(
                            '${address.city}, ${address.state}',
                            style: context.bodySmall?.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColors.white,
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
                controller: _scrollController,
                children: [
                  // Carousel
                  const Carousel(),
                  15.h,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: HomeTabChips(scrollController: _scrollController),
                  ),
                  20.h,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: HomeProducts(titles: chips),
                  ),
                ],
              ),
            ),
          ],
        );
      },
      error: (error, stackTrace) {
        print(error);
        print(stackTrace);
        return const Center(child: Text('error occured'));
      },
      loading: () => const HomeTabWireframe(),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
