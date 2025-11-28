import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ciyone_nutrimix/models/address_model.dart';
import 'package:ciyone_nutrimix/views/widgets/buttons.dart';
import 'package:ciyone_nutrimix/core/utils/app_navigator.dart';
import 'package:ciyone_nutrimix/core/constants/app_colors.dart';
import 'package:ciyone_nutrimix/core/utils/theme_extension.dart';
import 'package:ciyone_nutrimix/core/utils/sized_box_extension.dart';
import 'package:ciyone_nutrimix/views/providers/my_details_provider.dart';
import 'package:ciyone_nutrimix/views/home/tabs/profile_tab/views/address/add_new_address.dart';
import 'package:ciyone_nutrimix/views/home/tabs/profile_tab/views/address/address_screen.dart';

class BuildAddress extends ConsumerWidget {
  const BuildAddress({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myDetails = ref.watch(myDetailsProvider);
    return myDetails.when(
      data: (data) {
        AddressModel? myAddress = data.addressIndex >= 0
            ? data.address[data.addressIndex]
            : null;
        return Column(
          children: [
            if (myAddress == null)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Text('No Address Added'),
                    const Spacer(),
                    SizedBox(
                      height: 30,
                      child: PrimaryButton(
                        label: '   Add New Address   ',
                        onPressed: () {
                          AppNavigator.push(const AddNewAddress());
                        },
                        borderButton: true,
                        fontSize: 12,
                        borderRadius: 6,
                      ),
                    ),
                  ],
                ),
              )
            else
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: .start,
                        children: [
                          Row(
                            children: [
                              Text('Deliver To:  ', style: context.bodyMedium),
                              Expanded(
                                flex: 3,
                                child: Text(
                                  myAddress.name,
                                  style: context.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text(
                                ', ',
                                style: context.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  myAddress.pincode,
                                  style: context.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              4.w,
                            ],
                          ),
                          Text(
                            '${myAddress.address}, ${myAddress.city}, ${myAddress.state}.',
                            style: context.bodyMedium?.copyWith(
                              color: AppColors.secondaryTextColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    10.w,
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.borderColor,
                        border: Border.all(color: AppColors.borderStrokeColor),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        myAddress.addressType,
                        style: context.bodyMedium,
                      ),
                    ),
                    10.w,
                    SizedBox(
                      height: 30,
                      child: PrimaryButton(
                        label: '   Change   ',
                        onPressed: () {
                          AppNavigator.push(const AddressScreen());
                        },
                        borderButton: true,
                        fontSize: 12,
                        borderRadius: 6,
                      ),
                    ),
                  ],
                ),
              ),
            const SizedBox(height: 2, child: Divider()),
          ],
        );
      },
      error: (error, stackTrace) {
        return const Center(child: Text('Error occured'));
      },
      loading: () {
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
