import 'package:ciyone_nutrimix/core/constants/app_colors.dart';
import 'package:ciyone_nutrimix/core/constants/app_icons.dart';
import 'package:ciyone_nutrimix/core/utils/app_navigator.dart';
import 'package:ciyone_nutrimix/core/utils/sized_box_extension.dart';
import 'package:ciyone_nutrimix/core/utils/theme_extension.dart';
import 'package:ciyone_nutrimix/models/address_model.dart';
import 'package:ciyone_nutrimix/views/home/tabs/profile_tab/views/about_us_screen.dart';
import 'package:ciyone_nutrimix/views/home/tabs/profile_tab/views/contact_us_screen.dart';
import 'package:ciyone_nutrimix/views/home/tabs/profile_tab/views/faq_screen.dart';
import 'package:ciyone_nutrimix/views/home/tabs/profile_tab/views/address/address_screen.dart';
import 'package:ciyone_nutrimix/views/home/tabs/profile_tab/views/authenticity_screen.dart';
import 'package:ciyone_nutrimix/views/home/tabs/profile_tab/views/gift_card/gift_card_screen.dart';
import 'package:ciyone_nutrimix/views/home/tabs/profile_tab/views/health_profile_screen.dart';
import 'package:ciyone_nutrimix/views/home/tabs/profile_tab/views/history_screen.dart';
import 'package:ciyone_nutrimix/views/home/tabs/profile_tab/views/membership_screen.dart';
import 'package:ciyone_nutrimix/views/home/tabs/profile_tab/views/notification_screen.dart';
import 'package:ciyone_nutrimix/views/home/tabs/profile_tab/views/order/orders_screen.dart';
import 'package:ciyone_nutrimix/views/home/tabs/profile_tab/views/profile_detail.dart';
import 'package:ciyone_nutrimix/views/home/tabs/profile_tab/views/refer_and_earn/refer_and_earn.dart';
import 'package:ciyone_nutrimix/views/home/tabs/profile_tab/views/rewards_screen.dart';
import 'package:ciyone_nutrimix/views/home/tabs/profile_tab/views/store_locator_screen.dart';
import 'package:ciyone_nutrimix/views/home/tabs/profile_tab/views/wish_list/wish_list_screen.dart';
import 'package:ciyone_nutrimix/views/providers/my_details_provider.dart';
import 'package:ciyone_nutrimix/views/splash_screen.dart';
import 'package:ciyone_nutrimix/views/widgets/custom_icon.dart';
import 'package:ciyone_nutrimix/views/widgets/show_app_snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> options = [
      {
        'icon': AppIcons.square3d,
        'label': 'My Orders',
        'screen': const OrdersScreen(),
      },
      {
        'icon': AppIcons.heart,
        'label': 'My Wishlist',
        'screen': const WishListScreen(),
      },
      {
        'icon': AppIcons.sidebarBottom,
        'label': 'Check authenticity',
        'screen': const AuthenticityScreen(),
      },
      {
        'icon': AppIcons.health,
        'label': 'Health profile',
        'screen': const HealthProfileScreen(),
      },
      {
        'icon': AppIcons.clock,
        'label': 'Activity history',
        'screen': const HistoryScreen(),
      },
      {
        'icon': AppIcons.cash,
        'label': 'HK Cash',
        'screen': const RewardsScreen(),
      },
      {
        'icon': AppIcons.crown,
        'label': 'Membership',
        'screen': const MembershipScreen(),
      },
      {
        'icon': AppIcons.shop,
        'label': 'Store locator',
        'screen': const StoreLocatorScreen(),
      },
      {
        'icon': AppIcons.gift,
        'label': 'Gift Card',
        'screen': const GiftCardScreen(),
      },
      {
        'icon': AppIcons.earn,
        'label': 'Refer & earn',
        'screen': const ReferAndEarn(),
      },
      {
        'icon': AppIcons.user,
        'label': 'Profile details',
        'screen': const ProfileDetail(),
      },
      {
        'icon': AppIcons.location,
        'label': 'My address',
        'screen': const AddressScreen(),
      },
      {
        'icon': AppIcons.notification,
        'label': 'Notifications',
        'screen': const NotificationScreen(),
      },
      {
        'icon': AppIcons.infoCircle,
        'label': 'About Us',
        'screen': const AboutUsScreen(),
      },
      {'icon': AppIcons.faq, 'label': 'FAQ', 'screen': const FaqScreen()},
      {
        'icon': AppIcons.callCalling,
        'label': 'Contact Us',
        'screen': const ContactUsScreen(),
      },
      {
        'icon': AppIcons.barcode,
        'label': 'Policies',
        'screen': const OrdersScreen(),
      },
      {
        'icon': AppIcons.logout,
        'label': 'Logout',
        'screen': null,
        'function': () async {
          try {
            await FirebaseAuth.instance.signOut();
            if (!context.mounted) {
              return;
            }
            showAppSnackbar(
              context: context,
              snackBarType: SnackBarType.success,
              message: 'You Logged Out Successfully...',
            );
            AppNavigator.pushAndRemoveUntil(
              const SplashScreen(),
              pageAnimation: PageAnimation.fade,
            );
          } on FirebaseException catch (err) {
            if (!context.mounted) {
              return;
            }
            showAppSnackbar(
              context: context,
              snackBarType: SnackBarType.error,
              message: err.message ?? 'Unknown error occured',
            );
          }
        },
      },
    ];
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Card(
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(6),
              ),
              child: Consumer(
                builder: (context, ref, child) {
                  final myDetails = ref.watch(myDetailsProvider);
                  return myDetails.when(
                    data: (myDetails) {
                      AddressModel? address = myDetails.addressIndex >= 0
                          ? myDetails.address[myDetails.addressIndex]
                          : null;
                      return ListTile(
                        leading: CircleAvatar(
                          radius: 27,
                          backgroundColor: AppColors.white,
                          child: Text(
                            myDetails.name[0],
                            style: context.titleLarge,
                          ),
                        ),
                        title: Text(myDetails.name),
                        titleTextStyle: context.titleLarge,
                        subtitle: address != null
                            ? Text('${address.city}, ${address.state}')
                            : const Text(''),
                        trailing: CustomIcon(
                          AppIcons.edit,
                          onPressed: () {
                            AppNavigator.push(const ProfileDetail());
                          },
                        ),
                      );
                    },
                    error: (error, stackTrace) => const SizedBox.shrink(),
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                  );
                },
              ),
            ),
            20.h,
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: options.length,
              itemBuilder: (context, index) {
                Map option = options[index];
                return GestureDetector(
                  onTap: option['screen'] != null
                      ? () {
                          AppNavigator.push(option['screen']);
                        }
                      : option['function'],
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.5),
                    child: Row(
                      children: [
                        CustomIcon(
                          option['icon'],
                          size: 22,
                          color: AppColors.primary,
                        ),
                        15.w,
                        Text(
                          option['label'],
                          style: context.bodyLarge?.copyWith(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Text(
                'Version 0.0.1',
                style: context.bodyLarge?.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
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
