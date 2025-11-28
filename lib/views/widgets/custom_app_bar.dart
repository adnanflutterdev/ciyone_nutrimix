import 'package:flutter/material.dart';
import 'package:ciyone_nutrimix/core/constants/app_colors.dart';
import 'package:ciyone_nutrimix/core/constants/app_icons.dart';
import 'package:ciyone_nutrimix/core/utils/app_navigator.dart';
import 'package:ciyone_nutrimix/core/utils/theme_extension.dart';
import 'package:ciyone_nutrimix/views/widgets/custom_icon.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, this.title, this.actions});
  final String? title;
  final List<Widget>? actions;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 40,
      leading: CustomIcon(
        AppIcons.arrowBack,
        onPressed: () => AppNavigator.pop(),
        horzontalPadding: 8,
      ),
      titleSpacing: 0,
      title: title != null
          ? Text(
              title!,
              style: context.titleSmall?.copyWith(fontFamily: 'PoppinsBold'),
            )
          : const SizedBox.shrink(),
      actions: actions,

      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: AppColors.borderStrokeColor.withValues(alpha: 0.6),
        ),
      ),
    );
  }
}
