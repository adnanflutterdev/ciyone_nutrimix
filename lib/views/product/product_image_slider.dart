import 'package:cached_network_image/cached_network_image.dart';
import 'package:ciyone_nutrimix/core/constants/app_colors.dart';
import 'package:ciyone_nutrimix/core/constants/app_icons.dart';
import 'package:ciyone_nutrimix/core/utils/screen_size.dart';
import 'package:ciyone_nutrimix/core/utils/sized_box_extension.dart';
import 'package:ciyone_nutrimix/views/widgets/custom_icon.dart';
import 'package:ciyone_nutrimix/views/widgets/heart_button.dart';
import 'package:flutter/material.dart';

class ProductImageSlider extends StatefulWidget {
  const ProductImageSlider({
    super.key,
    required this.images,
    required this.productId,
  });
  final List<String> images;
  final String productId;

  @override
  State<ProductImageSlider> createState() => _ProductImageSliderState();
}

class _ProductImageSliderState extends State<ProductImageSlider> {
  int currentIndex = 0;
  late final PageController pageController;
  bool _disposed = false;

  @override
  void initState() {
    super.initState();
    pageController = PageController();

    // Start the slider AFTER PageView is attached
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // automaticSlider();
    });
  }

  void automaticSlider() async {
    // Stop recursion when disposed
    if (_disposed) return;

    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    currentIndex = (currentIndex + 1) % widget.images.length;

    if (mounted) {
      setState(() {});
    }

    if (pageController.hasClients) {
      pageController.animateToPage(
        currentIndex,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    }

    automaticSlider(); // Continue the loop safely
  }

  @override
  void dispose() {
    _disposed = true;
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.borderColor),
            borderRadius: BorderRadius.circular(10),
          ),
          height: 280,
          child: Stack(
            children: [
              Center(
                child: SizedBox(
                  height: 240,
                  width: ScreenSize.width,
                  child: PageView.builder(
                    controller: pageController,
                    onPageChanged: (value) {
                      setState(() => currentIndex = value);
                    },
                    itemCount: widget.images.length,
                    itemBuilder: (context, index) {
                      final image = widget.images[index];
                      return CachedNetworkImage(
                        imageUrl: image,
                        fit: BoxFit.fitHeight,
                        placeholder: (context, url) => const Center(
                          child: SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Positioned(
                top: 15,
                right: 15,
                child: Column(
                  children: [
                    HeartButton(productId: widget.productId, size: 22),
                    15.h,
                    const CustomIcon(
                      AppIcons.share,
                      color: AppColors.secondaryIconColor,
                      size: 22,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        8.h,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.images.length, (index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: CustomIcon(
                currentIndex == index
                    ? AppIcons.filledCircle
                    : AppIcons.untickCircle,
                size: 8,
                color: currentIndex == index
                    ? AppColors.primary
                    : AppColors.primaryIconColor,
              ),
            );
          }),
        ),
      ],
    );
  }
}
