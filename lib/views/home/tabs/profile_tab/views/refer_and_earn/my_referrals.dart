import 'package:flutter/material.dart';
import 'package:ciyone_nutrimix/core/constants/app_colors.dart';
import 'package:ciyone_nutrimix/core/utils/theme_extension.dart';
import 'package:ciyone_nutrimix/views/widgets/expand_toggler.dart';

class MyReferrals extends StatefulWidget {
  const MyReferrals({
    super.key,
    required this.title,
    required this.contents,
    required this.scrollController,
  });
  final String title;
  final List<Map> contents;
  final ScrollController scrollController;
  @override
  State<MyReferrals> createState() => _MyReferralsState();
}

class _MyReferralsState extends State<MyReferrals> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpandToggler(
          title: widget.title,
          onChanged: (value) {
            isExpanded = value;
            setState(() {});
            Future.delayed(const Duration(milliseconds: 200), () {
              if (isExpanded) {
                widget.scrollController.animateTo(
                  widget.scrollController.position.maxScrollExtent,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.bounceInOut,
                );
              }
            });
          },
        ),
        AnimatedSize(
          duration: const Duration(milliseconds: 300),
          child: isExpanded
              ? Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ListView.builder(
                    itemCount: widget.contents.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      Map content = widget.contents[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          children: [
                            Text(
                              content['label'],
                              style: context.bodyLarge?.copyWith(
                                color: AppColors.secondaryTextColor,
                              ),
                            ),
                            const Spacer(),
                            Text(content['value'], style: context.titleSmall),
                          ],
                        ),
                      );
                    },
                  ),
                )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}
