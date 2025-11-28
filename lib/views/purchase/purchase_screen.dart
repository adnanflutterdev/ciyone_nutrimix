import 'package:ciyone_nutrimix/core/constants/app_colors.dart';
import 'package:ciyone_nutrimix/core/constants/app_icons.dart';
import 'package:ciyone_nutrimix/core/utils/app_navigator.dart';
import 'package:ciyone_nutrimix/core/utils/screen_size.dart';
import 'package:ciyone_nutrimix/core/utils/theme_extension.dart';
import 'package:ciyone_nutrimix/models/new_product_model.dart';
import 'package:ciyone_nutrimix/views/purchase/views/widgets/stepper_views.dart';
import 'package:ciyone_nutrimix/core/global_notifier/quantity_notifier.dart';
import 'package:ciyone_nutrimix/views/widgets/custom_icon.dart';
import 'package:flutter/material.dart';

class PurchaseScreen extends StatefulWidget {
  const PurchaseScreen({super.key, required this.product});
  final NewProductModel product;

  @override
  State<PurchaseScreen> createState() => _PurchaseScreenState();
}

class _PurchaseScreenState extends State<PurchaseScreen> {
  int stepperIndex = 0;
  List<String> stepperLabel = ['Review', 'Address', 'Place Order', 'Payment'];

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,

      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 40,
          leading: CustomIcon(
            AppIcons.arrowBack,
            onPressed: () {
              if (stepperIndex == 0) {
                AppNavigator.pop();
                quantity.value = 1;
              } else {
                setState(() {
                  stepperIndex--;
                });
              }
            },
            horzontalPadding: 8,
          ),
          titleSpacing: 0,
          title: Text(
            'Continue Purchase',
            style: context.titleSmall?.copyWith(fontFamily: 'PoppinsBold'),
          ),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: AppColors.borderStrokeColor.withValues(alpha: 0.6),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  children: List.generate(
                    4,
                    (index) =>
                        _buildStepper(stepperIndex: stepperIndex, index: index),
                  ).toList(),
                ),
              ),
              stepperViews(product: widget.product)[stepperIndex],
            ],
          ),
        ),
        bottomNavigationBar: SafeArea(
          child: stepperIndex != 3
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      stepperIndex++;
                    });
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      color: AppColors.primary,
                      border: Border(
                        top: BorderSide(color: AppColors.borderStrokeColor),
                      ),
                    ),
                    width: ScreenSize.width,
                    height: 60,
                    child: Center(
                      child: Text(
                        stepperIndex == 1
                            ? 'Save Address & Proceed'
                            : stepperIndex == 2
                            ? 'Place Order'
                            : 'Continue',
                        style: context.bodyLarge?.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                )
              : const SizedBox.shrink(),
        ),
      ),
    );
  }

  Widget _buildStepper({required int stepperIndex, required int index}) {
    return Expanded(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Divider(
                  color: index == 0
                      ? Colors.transparent
                      : stepperIndex >= index
                      ? AppColors.stepperActiveColor
                      : AppColors.borderColor,
                ),
              ),
              CustomIcon(
                stepperIndex > index
                    ? AppIcons.tickCircle
                    : stepperIndex == index
                    ? AppIcons.activeCircle
                    : AppIcons.untickCircle,
                color: stepperIndex > index
                    ? AppColors.stepperActiveColor
                    : stepperIndex == index
                    ? AppColors.stepperActiveColor
                    : AppColors.borderColor,
              ),
              Expanded(
                child: Divider(
                  color: index == 3
                      ? Colors.transparent
                      : stepperIndex > index
                      ? AppColors.stepperActiveColor
                      : AppColors.borderColor,
                ),
              ),
            ],
          ),
          Text(stepperLabel[index], style: context.bodySmall),
        ],
      ),
    );
  }
}
