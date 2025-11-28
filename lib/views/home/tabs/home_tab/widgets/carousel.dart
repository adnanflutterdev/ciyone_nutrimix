import 'package:ciyone_nutrimix/core/constants/app_colors.dart';
import 'package:ciyone_nutrimix/core/constants/app_icons.dart';
import 'package:ciyone_nutrimix/views/widgets/custom_icon.dart';
import 'package:flutter/material.dart';

class Carousel extends StatefulWidget {
  const Carousel({super.key});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int currentIndex = 0;
  late final PageController pageController;
  bool _isDisposed = false;

  @override
  void initState() {
    super.initState();
    pageController = PageController();

    // Start auto slider only after widget is fully built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      automaticSlider();
    });
  }

  void automaticSlider() async {
    if (_isDisposed) return;

    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    // Safe update
    currentIndex = (currentIndex + 1) % 5;

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

    automaticSlider(); // continue loop
  }

  @override
  void dispose() {
    _isDisposed = true;
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: PageView.builder(
            controller: pageController,
            onPageChanged: (value) {
              setState(() => currentIndex = value);
            },
            itemCount: 5,
            itemBuilder: (context, index) {
              return Image.asset(
                'assets/dummy_images/carousel.jpg',
                fit: BoxFit.fitHeight,
              );
            },
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(5, (index) {
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

