import 'package:ciyone_nutrimix/core/constants/app_colors.dart';
import 'package:ciyone_nutrimix/core/constants/app_icons.dart';
import 'package:ciyone_nutrimix/core/utils/sized_box_extension.dart';
import 'package:ciyone_nutrimix/core/utils/theme_extension.dart';
import 'package:ciyone_nutrimix/views/widgets/custom_icon.dart';
import 'package:flutter/material.dart';

class PaymentOptionsDropDown extends StatefulWidget {
  const PaymentOptionsDropDown({
    super.key,
    required this.title,
    required this.logo,
    required this.subtitle,
    this.onChanged,
    this.onTap,
    this.icon,
  });
  final String title;
  final String logo;
  final String subtitle;
  final ValueChanged<bool>? onChanged;
  final Function()? onTap;
  final String? icon;

  @override
  State<PaymentOptionsDropDown> createState() => _PaymentOptionsDropDownState();
}

class _PaymentOptionsDropDownState extends State<PaymentOptionsDropDown> {
  bool isStreached = false;
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onChanged != null
          ? () {
              isStreached = !isStreached;
              widget.onChanged!(isStreached);
              setState(() {});
            }
          : widget.onTap,
      child: Container(
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.borderColor),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Image.asset(widget.logo, fit: BoxFit.contain),
                  ),
                ),
                8.w,
                Text(widget.title, style: context.bodyLarge),
                const Spacer(),
                CustomIcon(
                  widget.icon != null
                      ? widget.icon!
                      : isStreached
                      ? AppIcons.arrowUp
                      : AppIcons.arrowDown,
                ),
              ],
            ),
            if (widget.subtitle != '')
              Padding(
                padding: const EdgeInsetsGeometry.symmetric(horizontal: 36.0),
                child: Text(
                  widget.subtitle,
                  style: context.bodySmall?.copyWith(
                    color: AppColors.secondaryTextColor,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
