import 'package:ciyone_nutrimix/core/constants/app_colors.dart';
import 'package:ciyone_nutrimix/core/constants/app_icons.dart';
import 'package:ciyone_nutrimix/core/utils/sized_box_extension.dart';
import 'package:ciyone_nutrimix/core/utils/theme_extension.dart';
import 'package:ciyone_nutrimix/views/widgets/custom_icon.dart';
import 'package:flutter/material.dart';

class ExpandToggler extends StatefulWidget {
  const ExpandToggler({
    super.key,
    required this.value,
    this.title,
    this.onChanged,
    this.icon,
    this.fontSize,
    // this.child,
  });
  final String? value;
  final String? title;
  final double? fontSize;
  final CustomIcon? icon;
  final ValueChanged<bool>? onChanged;
  // final Widget? child;

  @override
  State<ExpandToggler> createState() => _ExpandTogglerState();
}

class _ExpandTogglerState extends State<ExpandToggler> {
  bool _isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: ValueKey<bool>(_isSwitched),
      onTap: widget.onChanged != null
          ? () {
              _isSwitched = !_isSwitched;
              widget.onChanged!(_isSwitched);
              setState(() {});
            }
          : null,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.borderColor),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          children: [
            Expanded(
              child: RichText(
                text: TextSpan(
                  text: widget.title ?? '',
                  style: context.bodyLarge?.copyWith(
                    color: AppColors.secondaryTextColor,
                    fontWeight: FontWeight.normal,
                    fontSize: widget.fontSize,
                  ),
                  children: [
                    TextSpan(
                      text: widget.value ?? '',
                      style: context.bodyLarge?.copyWith(
                        fontSize: widget.fontSize,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            15.w,
            widget.icon ??
                CustomIcon(
                  _isSwitched ? AppIcons.arrowUp : AppIcons.arrowDown,
                  horzontalPadding: 8,
                  verticalPadding: 8,
                ),
          ],
        ),
      ),
    );
  }
}
