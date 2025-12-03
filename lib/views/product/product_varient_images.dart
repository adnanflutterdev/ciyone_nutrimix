import 'package:ciyone_nutrimix/core/constants/app_icons.dart';
import 'package:ciyone_nutrimix/models/product_model.dart';
import 'package:ciyone_nutrimix/views/widgets/custom_icon.dart';
import 'package:ciyone_nutrimix/views/widgets/expand_toggler.dart';
import 'package:flutter/material.dart';

class ProductVarientImages extends StatefulWidget {
  const ProductVarientImages({
    super.key,
    required this.varientImages,
    required this.varientIndex,
  });
  final List<VarientImages> varientImages;
  final ValueNotifier<int> varientIndex;

  @override
  State<ProductVarientImages> createState() => _VarientImagesState();
}

class _VarientImagesState extends State<ProductVarientImages> {
  bool isExpanded = false;
  late List<VarientImages> varientImages;
  late ValueNotifier<int> varientIndex;

  @override
  void initState() {
    super.initState();
    varientImages = widget.varientImages;
    varientIndex = widget.varientIndex;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: varientIndex,
      builder: (context, index, child) {
        return Column(
          children: [
            ExpandToggler(
              title: '${varientImages[index].label} : ',
              value: varientImages[index].value,
              onChanged: varientImages.length > 1
                  ? (value) {
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                    }
                  : null,
            ),
            AnimatedSize(
              duration: const Duration(milliseconds: 300),
              child: isExpanded
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 10,
                      ),
                      child: Column(
                        children: List.generate(varientImages.length, (i) {
                          if (i == index) {
                            return const SizedBox.shrink();
                          }
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: GestureDetector(
                              onTap: () {
                                varientIndex.value = i;
                              },
                              child: ExpandToggler(
                                value: varientImages[i].value,
                                icon: const CustomIcon(AppIcons.arrowForward),
                                fontSize: 12,
                              ),
                            ),
                          );
                        }),
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        );
      },
    );
  }
}
