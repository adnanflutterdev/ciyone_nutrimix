import 'package:flutter/material.dart';
import 'package:ciyone_nutrimix/core/constants/app_colors.dart';
import 'package:ciyone_nutrimix/core/constants/app_icons.dart';
import 'package:ciyone_nutrimix/core/utils/screen_size.dart';
import 'package:ciyone_nutrimix/core/utils/sized_box_extension.dart';
import 'package:ciyone_nutrimix/core/utils/theme_extension.dart';
class HealthkartCard extends StatelessWidget {
  const HealthkartCard({super.key});

  @override
  Widget build(BuildContext context) {
        double width = ScreenSize.width - 60;
    double height = width / 2.34;
    double diameter1 = width / 1.89;
    double diameter2 = width / 3.26;
    return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: SizedBox(
                width: width,
                height: height,
                child: Stack(
                  children: [
                    Container(
                      width: width,
                      height: height,
                      decoration: BoxDecoration(
                        color: AppColors.stepperActiveColor.withValues(
                          alpha: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    Container(
                      width: width,
                      height: height,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: [0.21, 0.77, 1.0],
                          colors: [
                            AppColors.stepperActiveColor,
                            AppColors.stepperActiveColor.withValues(
                              alpha: 0.18,
                            ),
                            AppColors.stepperActiveColor.withValues(
                              alpha: 0.31,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      right: -30,
                      top: -(diameter2 - (diameter2 / 1.41)),
                      child: Container(
                        width: diameter2,
                        height: diameter2,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [
                              AppColors.white.withValues(alpha: 0.14),
                              AppColors.white.withValues(alpha: 0),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: -30,
                      bottom: -(diameter1 - (diameter1 / 1.81)),
                      child: Container(
                        width: diameter1,
                        height: diameter1,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [
                              AppColors.white.withValues(alpha: 0.24),
                              AppColors.white.withValues(alpha: 0),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 20,
                      top: 15,
                      child: Row(
                        children: [
                          Text(
                            'HEALT',
                            style: context.bodyLarge?.copyWith(
                              color: AppColors.white,
                              fontFamily: 'PoppinsBold',
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 1),
                            color: AppColors.white,
                            child: Text(
                              'HK',
                              style: context.bodyLarge?.copyWith(
                                color: AppColors.stepperActiveColor,
                                letterSpacing: 1.5,
                              ),
                            ),
                          ),
                          Text(
                            'ART',
                            style: context.bodyLarge?.copyWith(
                              color: AppColors.white,
                              fontFamily: 'PoppinsBold',
                            ),
                          ),
                        ],
                      ),
                    ),

                    Positioned(
                      left: 30,
                      bottom: 20,
                      child: Image.asset(AppIcons.giftCard, width: 50),
                    ),

                    Positioned(
                      bottom: 20,
                      right: 0,
                      child: Column(
                        crossAxisAlignment: .start,
                        children: [
                          Text('Gift Cards', style: context.titleMedium?.copyWith(color: AppColors.white)),
                          5.h,
                          SizedBox(
                            width: width / 1.75,
                            child: Text(
                              'Gift your loved ones a Healthkart experience.',
                              style: context.bodyMedium?.copyWith(
                                color: AppColors.white,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
  }
}