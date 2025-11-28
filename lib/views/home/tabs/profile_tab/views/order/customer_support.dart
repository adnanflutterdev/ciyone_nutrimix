import 'package:ciyone_nutrimix/core/constants/app_colors.dart';
import 'package:ciyone_nutrimix/core/constants/app_icons.dart';
import 'package:ciyone_nutrimix/core/utils/screen_size.dart';
import 'package:ciyone_nutrimix/core/utils/sized_box_extension.dart';
import 'package:ciyone_nutrimix/core/utils/theme_extension.dart';
import 'package:ciyone_nutrimix/views/widgets/custom_app_bar.dart';
import 'package:ciyone_nutrimix/views/widgets/custom_icon.dart';
import 'package:flutter/material.dart';

class CustomerSupport extends StatefulWidget {
  const CustomerSupport({super.key});

  @override
  State<CustomerSupport> createState() => _CustomerSupportState();
}

class _CustomerSupportState extends State<CustomerSupport> {
  List<Map> chats = [
    {
      'isMine': false,
      'message': 'Welcome to Healthkart. how can I help you today?',
    },
  ];

  List<Map> menuItems = [
    {'icon': AppIcons.box, 'label': 'Order Related Query'},
    {'icon': AppIcons.likeShapes, 'label': 'Recommend Me A Product'},
    {'icon': AppIcons.userOctagon, 'label': 'Get Diet & Fitness Advice'},
    {'icon': AppIcons.taskSquare, 'label': 'Explore Fitness Programs'},
  ];

  TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void showSupportMenu(Offset position) async {
      showMenu(
        position: .fromLTRB(
          position.dx - 100,
          position.dy,
          0,
          ScreenSize.height - position.dy - 100,
        ),
        context: context,
        menuPadding: const EdgeInsets.symmetric(vertical: 8),
        color: AppColors.white,
        items: menuItems
            .map(
              (item) => PopupMenuItem(
                child: Row(
                  children: [
                    CustomIcon(
                      size: 20,
                      item['icon'],
                      color: AppColors.secondaryIconColor,
                    ),
                    10.w,
                    Text(
                      item['label'],
                      style: context.bodyLarge?.copyWith(
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      );
    }

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Customer Support',
        actions: [
          CustomIcon(
            AppIcons.menu,
            size: 24,
            horzontalPadding: 15,
            onTapDown: (details) {
              showSupportMenu(details.globalPosition);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListView.builder(
                itemCount: chats.length + 1,
                reverse: true,
                itemBuilder: (context, index) {
                  if (index == chats.length) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Text(
                          'Now',
                          style: context.bodyMedium?.copyWith(
                            color: AppColors.secondaryTextColor,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    );
                  }
                  final chat = chats[index];
                  bool isMine = chat['isMine'];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Container(
                      alignment: isMine
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: ScreenSize.width / 1.3,
                        ),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: isMine
                                ? AppColors.primary
                                : AppColors.stepperActiveColor,
                            borderRadius: BorderRadius.only(
                              topLeft: const Radius.circular(12),
                              topRight: const Radius.circular(12),
                              bottomLeft: Radius.circular(isMine ? 12 : 0),
                              bottomRight: Radius.circular(isMine ? 0 : 12),
                            ),
                          ),
                          child: Text(
                            chat['message'],
                            style: context.titleSmall?.copyWith(
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          SafeArea(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 120),
              child: TextField(
                maxLines: null,
                controller: controller,
                decoration: InputDecoration(
                  filled: true,
                  hintText: 'Type here...',
                  hintStyle: context.bodyLarge?.copyWith(
                    color: AppColors.secondaryTextColor,
                  ),
                  fillColor: AppColors.borderColor,
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  suffixIconConstraints: const BoxConstraints(maxWidth: 50),
                  suffixIcon: IconButton(
                    onPressed: () {
                      if (controller.text.isNotEmpty) {
                        chats.insert(0, {
                          'isMine': true,
                          'message': controller.text.trim(),
                        });
                        controller.clear();
                        setState(() {});
                      }
                    },
                    icon: const Icon(
                      Icons.send,
                      color: AppColors.stepperActiveColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
