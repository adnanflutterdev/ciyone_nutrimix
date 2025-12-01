import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ciyone_nutrimix/core/constants/app_colors.dart';
import 'package:ciyone_nutrimix/core/utils/theme_extension.dart';
import 'package:ciyone_nutrimix/core/utils/sized_box_extension.dart';
import 'package:ciyone_nutrimix/views/widgets/custom_text_field.dart';

class AddressFields extends StatelessWidget {
  const AddressFields({
    super.key,
    required this.addressControllers,
    this.addressTypeIndex,
  });
  final List<TextEditingController> addressControllers;
  final int? addressTypeIndex;

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    List textFieldData = [
      {
        'maxLines': 1,
        'keyboardType': TextInputType.name,
        'controller': addressControllers[0],
        'title': 'Full Name',
        'hintText': 'Enter your fullname',
        'hasAddressTypeChips': false,
      },
      {
        'maxLines': 1,
        'keyboardType': TextInputType.emailAddress,
        'controller': addressControllers[1],
        'title': 'Email Id',
        'hintText': 'Enter your email id',
        'hasAddressTypeChips': false,
      },
      {
        'maxLines': 1,
        'keyboardType': TextInputType.phone,
        'controller': addressControllers[2],
        'title': 'Phone Number',
        'hintText': 'Enter your phone number',
        'hasAddressTypeChips': false,
      },
      {
        'maxLines': 3,
        'keyboardType': TextInputType.streetAddress,
        'controller': addressControllers[3],
        'title': 'Address',
        'hintText': 'Please add your full address',
        'hasAddressTypeChips': false,
      },
      {
        'maxLines': 1,
        'controller': addressControllers[4],
        'keyboardType': TextInputType.number,
        'hasAddressTypeChips': false,
        'title': 'Pincode',
        'hintText': 'Enter your pincode',
      },
      {
        'maxLines': 1,
        'title': 'City',
        'hasAddressTypeChips': false,
        'hintText': 'Enter your city',
        'controller': addressControllers[5],
        'keyboardType': TextInputType.streetAddress,
      },
      {
        'maxLines': 1,
        'title': 'State',
        'hasAddressTypeChips': false,
        'hintText': 'Enter your state',
        'controller': addressControllers[6],
        'keyboardType': TextInputType.streetAddress,
      },
      {
        'maxLines': 1,
        'hasAddressTypeChips': true,
        'title': 'Select an address type',
        'controller': addressControllers[7],
        'keyboardType': TextInputType.streetAddress,
        'hintText': 'eg: school, collage, temple,ground, etc...',
      },
    ];
    return Padding(
      padding: const EdgeInsetsGeometry.all(15),
      child: ListView.builder(
        controller: scrollController,
        itemCount: textFieldData.length,
        itemBuilder: (context, index) {
          final data = textFieldData[index];
          return _buildField(
            context,
            title: data['title'],
            hintText: data['hintText'],
            maxLines: data['maxLines'],
            controller: data['controller'],
            keyboardType: data['keyboardType'],
            hasAddressTypeChips: data['hasAddressTypeChips'],
            scrollController: index == 7 ? scrollController : null,
          );
        },
      ),
    );
  }

  Widget _buildField(
    BuildContext context, {
    required int maxLines,
    required String title,
    required String hintText,
    required bool hasAddressTypeChips,
    required TextInputType keyboardType,
    required TextEditingController controller,
    ScrollController? scrollController,
  }) {
    ValueNotifier<int> chipIndex = ValueNotifier(addressTypeIndex ?? 2);
    List<String> chips = ['Home', 'Office', 'Others'];
    return ValueListenableBuilder(
      valueListenable: chipIndex,
      builder: (context, value, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            15.h,
            RichText(
              text: TextSpan(
                text: title,
                style: context.bodyLarge,
                children: [
                  TextSpan(
                    text: '*',

                    style: context.bodyMedium?.copyWith(
                      color: AppColors.stepperActiveColor,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            6.h,

            if (hasAddressTypeChips)
              Row(
                children: List.generate(chips.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 10, bottom: 10),
                    child: GestureDetector(
                      onTap: () {
                        chipIndex.value = index;
                        if (index != 2) {
                          controller.text = chips[index];
                        } else {
                          controller.clear();
                        }
                        Timer(const Duration(milliseconds: 100), () {
                          scrollController!.jumpTo(
                            scrollController.position.maxScrollExtent,
                          );
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: value == index
                              ? AppColors.stepperActiveColor.withValues(
                                  alpha: 0.08,
                                )
                              : AppColors.borderColor,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          chips[index],
                          style: context.bodyMedium?.copyWith(
                            color: value == index
                                ? AppColors.stepperActiveColor
                                : AppColors.secondaryTextColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),

            if ((hasAddressTypeChips && value == 2) ||
                (hasAddressTypeChips == false))
              CustomTextField(
                hintText: hintText,
                maxLines: maxLines,
                keyboardType: keyboardType,
                controller: controller,
              ),
          ],
        );
      },
    );
  }
}
