import 'package:ciyone_nutrimix/core/utils/screen_size.dart';
import 'package:ciyone_nutrimix/views/providers/my_details_provider.dart';
import 'package:flutter/material.dart';
import 'package:ciyone_nutrimix/views/home/tabs.dart';
import 'package:ciyone_nutrimix/views/widgets/custom_icon.dart';
import 'package:ciyone_nutrimix/core/constants/app_colors.dart';
import 'package:ciyone_nutrimix/core/utils/theme_extension.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ValueNotifier<int> _currentIndex = ValueNotifier(0);
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(ScreenSize.width, 1),
        child: Consumer(
          builder: (context, ref, child) {
            final myDetails = ref.watch(myDetailsProvider);
            return myDetails.when(
              data: (data) =>
                  AppBar(toolbarHeight: 1, backgroundColor: AppColors.primary),
              error: (error, stackTrace) => AppBar(toolbarHeight: 1),
              loading: () => AppBar(toolbarHeight: 1),
            );
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              itemCount: pages.length,
              controller: _pageController,
              onPageChanged: (value) {
                _currentIndex.value = value;
              },
              itemBuilder: (context, index) {
                return pages[index];
              },
            ),
          ),
          SafeArea(
            child: Container(
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(color: AppColors.borderStrokeColor),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 10.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(tabs.length, (index) {
                    final tab = tabs[index];
                    return ValueListenableBuilder(
                      valueListenable: _currentIndex,
                      builder: (context, pageIndex, child) {
                        return GestureDetector(
                          onTap: () {
                            _pageController.animateToPage(
                              index,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn,
                            );
                          },
                          child: Container(
                            width: (ScreenSize.width - 30) / 4,
                            color: Colors.transparent,
                            child: Column(
                              children: [
                                CustomIcon(
                                  tab['icon'],
                                  color: pageIndex == index
                                      ? AppColors.primary
                                      : AppColors.secondaryIconColor,
                                ),
                                Text(
                                  tab['label'],
                                  style: context.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: pageIndex == index
                                        ? AppColors.primary
                                        : AppColors.secondaryIconColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
