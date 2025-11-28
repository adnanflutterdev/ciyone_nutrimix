import 'package:ciyone_nutrimix/core/constants/app_colors.dart';
import 'package:ciyone_nutrimix/core/constants/app_icons.dart';
import 'package:ciyone_nutrimix/views/home/tabs/profile_tab/views/wish_list/wish_list_function.dart';
import 'package:ciyone_nutrimix/views/providers/my_details_provider.dart';
import 'package:ciyone_nutrimix/views/widgets/custom_icon.dart';
import 'package:ciyone_nutrimix/views/widgets/heart_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HeartButton extends StatelessWidget {
  const HeartButton({super.key,required this.productId,this.size});
  final String productId;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final myDetails = ref.watch(myDetailsProvider);
        return myDetails.when(
          data: (data) {
            List<String> whishList = data.wishList;
            return CustomIcon(
              size:  size ?? 16,
              whishList.contains(productId)
                  ? AppIcons.heartFilled
                  : AppIcons.heart,
              color: whishList.contains(productId)
                  ? AppColors.heartColor
                  : AppColors.secondaryIconColor,
              onPressed: () {
                toggleWishListItem(
                  context,
                  productId: productId,
                  isInWishlist: whishList.contains(productId),
                );
              },
            );
          },
          error: (error, stackTrace) {
            return heartLoader;
          },
          loading: () {
            return heartLoader;
          },
        );
      },
    );
  }
}
