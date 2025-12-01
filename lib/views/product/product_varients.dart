import 'package:ciyone_nutrimix/core/constants/app_icons.dart';
import 'package:ciyone_nutrimix/core/utils/app_navigator.dart';
import 'package:ciyone_nutrimix/models/new_product_model.dart';
import 'package:ciyone_nutrimix/views/product/product_detail_screen.dart';
import 'package:ciyone_nutrimix/views/widgets/custom_icon.dart';
import 'package:ciyone_nutrimix/views/widgets/expand_toggler.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductVarients extends StatefulWidget {
  const ProductVarients({
    super.key,
    required this.currentVarient,
    required this.varientProducts,
  });
  final CurrentVarient currentVarient;
  final List<VarientProducts> varientProducts;

  @override
  State<ProductVarients> createState() => _VarientImagesState();
}

class _VarientImagesState extends State<ProductVarients> {
  bool isExpanded = false;
  late CurrentVarient currentVarient;
  late List<VarientProducts> varientProducts;

  @override
  void initState() {
    super.initState();
    currentVarient = widget.currentVarient;
    varientProducts = widget.varientProducts;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpandToggler(
          title: '${currentVarient.label} : ',
          value: currentVarient.value,
          onChanged: (value) {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
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
                    children: List.generate(varientProducts.length, (i) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection('products')
                              .doc(varientProducts[i].varientId)
                              .snapshots(),

                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            if (snapshot.hasError ||
                                snapshot.data == null ||
                                !snapshot.data!.exists) {
                              return const SizedBox.shrink();
                            }
                            NewProductModel varientProduct =
                                NewProductModel.fromJson(
                                  snapshot.data!.data()!,
                                );
                            return GestureDetector(
                              onTap: () {
                                AppNavigator.pushReplacement(
                                  ProductDetailScreen(product: varientProduct),
                                );
                              },
                              child: ExpandToggler(
                                value: varientProducts[i].value,
                                icon: const CustomIcon(AppIcons.arrowForward),
                                fontSize: 12,
                              ),
                            );
                          },
                        ),
                      );
                    }),
                  ),
                )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}
