import 'package:ciyone_nutrimix/core/constants/app_colors.dart';
import 'package:ciyone_nutrimix/core/utils/app_navigator.dart';
import 'package:flutter/material.dart';

void customAlertDialog(
  BuildContext context, {
  required String title,
  required String content,
  required String action,
  required Function() actionFunction,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () {
              AppNavigator.pop();
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: actionFunction,
            child: Text(
              action,
              style: const TextStyle(color: AppColors.highlightTextColor),
            ),
          ),
        ],
      );
    },
  );
}
