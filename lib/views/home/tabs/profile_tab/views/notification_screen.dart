import 'package:ciyone_nutrimix/core/constants/app_colors.dart';
import 'package:ciyone_nutrimix/core/constants/app_icons.dart';
import 'package:ciyone_nutrimix/core/utils/app_navigator.dart';
import 'package:ciyone_nutrimix/core/utils/sized_box_extension.dart';
import 'package:ciyone_nutrimix/core/utils/theme_extension.dart';
import 'package:ciyone_nutrimix/views/widgets/custom_icon.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  int chipIndex = 0;
  List<String> chips = ['All', 'Orders', 'General'];
  List<Map> notifications = [
    {
      'title': 'New In: For Steaming Hot Wo',
      'subTitle':
          '@ rs 249: muscleblaze high-caffeine workout coffee in hazelnut flavour',
      'date': 'Today',
    },
    {
      'title': 'Thanks For Your Order!',
      'subTitle': 'We will update once your package is shipped',
      'date': '22,Feb 2023',
    },
    {
      'title': 'Customer, This Is Important!',
      'subTitle': 'Check out now!',
      'date': '05,Feb 2023',
    },
    {
      'title': 'New In: For Steaming Hot Wo',
      'subTitle':
          '@ rs 249: muscleblaze high-caffeine workout coffee in hazelnut flavour',
      'date': '18,Mar 2023',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 40,
        leading: CustomIcon(
          AppIcons.arrowBack,
          onPressed: () => AppNavigator.pop(),
          horzontalPadding: 8,
        ),
        titleSpacing: 0,
        title: Text(
          'Notifications',
          style: context.titleSmall?.copyWith(fontFamily: 'PoppinsBold'),
        ),

        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: AppColors.borderStrokeColor.withValues(alpha: 0.6),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: List.generate(chips.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        chipIndex = index;
                      });
                    },
                    child: Chip(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(6),
                        side: BorderSide(
                          width: chipIndex == index ? 1 : 0,
                          color: chipIndex == index
                              ? AppColors.borderStrokeColor
                              : AppColors.borderColor,
                        ),
                      ),
                      label: Text(
                        chips[index],
                        style: context.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                Map notification = notifications[index];
                return Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: AppColors.borderColor),
                    ),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                    leading: Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Image.asset(
                        'assets/notifications/notification${index + 1}.png',
                      ),
                    ),
                    minLeadingWidth: 50,
                    minVerticalPadding: 16,
                    title: Padding(
                      padding: const EdgeInsets.only(bottom: 6.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              notification['title'],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          25.w,
                          Text(
                            notification['date'],
                            style: context.bodySmall?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    titleTextStyle: context.bodyMedium?.copyWith(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                    subtitle: Text(notification['subTitle']),
                    subtitleTextStyle: context.bodyMedium?.copyWith(
                      fontWeight: FontWeight.normal,
                      color: AppColors.secondaryTextColor,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
