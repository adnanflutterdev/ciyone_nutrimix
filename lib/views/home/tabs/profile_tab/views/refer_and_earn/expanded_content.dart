import 'package:ciyone_nutrimix/core/constants/app_colors.dart';
import 'package:ciyone_nutrimix/core/utils/sized_box_extension.dart';
import 'package:ciyone_nutrimix/core/utils/theme_extension.dart';
import 'package:ciyone_nutrimix/views/widgets/expand_toggler.dart';
import 'package:flutter/material.dart';

class ExpandedContent extends StatefulWidget {
  const ExpandedContent({
    super.key,
    required this.title,
    required this.contents,
    required this.scrollController,
  });
  final String title;
  final List<String> contents;
  final ScrollController scrollController;

  @override
  State<ExpandedContent> createState() => _ExpandedContentState();
}

class _ExpandedContentState extends State<ExpandedContent> {
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
                  widget.scrollController.position.maxScrollExtent - 100,
                  duration: const Duration(milliseconds: 500),
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
                      return Column(
                        crossAxisAlignment: .start,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: '${index + 1}. ',
                              style: context.titleSmall,
                              children: [
                                TextSpan(
                                  text: widget.contents[index],
                                  style: context.bodyLarge?.copyWith(
                                    color: AppColors.secondaryTextColor,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          10.h,
                        ],
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
