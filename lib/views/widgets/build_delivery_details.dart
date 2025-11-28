  import 'package:ciyone_nutrimix/core/constants/app_icons.dart';
import 'package:ciyone_nutrimix/core/utils/sized_box_extension.dart';
import 'package:ciyone_nutrimix/core/utils/theme_extension.dart';
import 'package:ciyone_nutrimix/views/widgets/custom_icon.dart';
import 'package:flutter/material.dart';

Widget buildDeliveryDetail(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CustomIcon(AppIcons.shipping),
        4.w,
        Text(
          'Delivery by Fri, 24 Feb',
          style: context.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
        ),
      ],
    );
  }