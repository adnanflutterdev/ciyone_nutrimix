import 'package:ciyone_nutrimix/core/constants/app_colors.dart';
import 'package:ciyone_nutrimix/core/constants/app_icons.dart';
import 'package:ciyone_nutrimix/core/utils/theme_extension.dart';
import 'package:ciyone_nutrimix/views/widgets/custom_icon.dart';
import 'package:flutter/material.dart';

class ExpandToggler extends StatefulWidget {
  const ExpandToggler({
    super.key,
    required this.title,
    this.onChanged,
    this.child,
  });
  final String? title;
  final ValueChanged<bool>? onChanged;
  final Widget? child;

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
            widget.child != null? widget.child! :
            Text(widget.title ?? '', style: context.bodyLarge),
            const Spacer(),
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
