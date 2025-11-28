import 'package:ciyone_nutrimix/core/constants/app_colors.dart';
import 'package:ciyone_nutrimix/core/constants/app_icons.dart';
import 'package:ciyone_nutrimix/core/utils/sized_box_extension.dart';
import 'package:ciyone_nutrimix/core/utils/theme_extension.dart';
import 'package:flutter/material.dart';

class InviteAndEarn extends StatelessWidget {
  const InviteAndEarn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.borderColor),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        children: [
                          Image.asset(AppIcons.giftDecorated, width: 24),
                          8.w,
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                text: 'Invite friends & get Rs.',
                                style: context.bodyMedium,
                                children: [
                                  TextSpan(
                                    text: ' 200 off on each order',
                                    style: context.bodyMedium?.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          8.w,
                          Container(
                            padding: const .symmetric(
                              horizontal: 14,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              'Invite & Earn',
                              style: context.bodySmall?.copyWith(
                                color: AppColors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
  }
}