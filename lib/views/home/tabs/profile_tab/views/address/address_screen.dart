import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ciyone_nutrimix/models/address_model.dart';
import 'package:ciyone_nutrimix/views/widgets/buttons.dart';
import 'package:ciyone_nutrimix/core/constants/app_icons.dart';
import 'package:ciyone_nutrimix/core/utils/app_navigator.dart';
import 'package:ciyone_nutrimix/views/widgets/custom_icon.dart';
import 'package:ciyone_nutrimix/core/constants/app_colors.dart';
import 'package:ciyone_nutrimix/core/utils/theme_extension.dart';
import 'package:ciyone_nutrimix/core/utils/sized_box_extension.dart';
import 'package:ciyone_nutrimix/views/home/tabs/profile_tab/views/address/add_new_address.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  // int _addressIndex = 0;
  // final List<AddressModel> _addresses = [];
  DocumentReference<Map> ref = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: ref.snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        final myData = snapshot.data!.data()!;

        List<AddressModel> myAddresses = (myData['address'] as List)
            .map((address) => AddressModel.fromJson(address))
            .toList();

        int addressIndex = myData['addressIndex'];

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
              'Select Delivery Address',
              style: context.titleSmall?.copyWith(fontFamily: 'PoppinsBold'),
            ),

            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: AppColors.borderStrokeColor.withValues(alpha: 0.6),
              ),
            ),
          ),
          body: myAddresses.isEmpty
              ? Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    mainAxisAlignment: .center,
                    children: [
                      Image.asset('assets/bg/no_address.png'),
                      Text(
                        'You didn\'t add you delivery address',
                        style: context.bodyLarge?.copyWith(
                          color: AppColors.secondaryTextColor,
                        ),
                      ),
                    ],
                  ),
                )
              : Padding(
                  padding: const .all(15.0),
                  child: ListView.builder(
                    itemCount: myAddresses.length,
                    itemBuilder: (context, index) {
                      AddressModel address = myAddresses[index];
                      return Column(
                        children: [
                          10.h,
                          GestureDetector(
                            onTap: () async {
                              addressIndex = index;
                              await ref.update({'addressIndex': addressIndex});
                            },
                            child: Container(
                              color: Colors.transparent,
                              child: Row(
                                children: [
                                  CustomIcon(
                                    addressIndex == index
                                        ? AppIcons.activeCircle
                                        : AppIcons.untickCircle,
                                    color: addressIndex == index
                                        ? AppColors.stepperActiveColor
                                        : AppColors.secondaryIconColor,
                                  ),
                                  8.w,
                                  Text(
                                    'Address-${index + 1}',
                                    style: context.bodyLarge,
                                  ),
                                  const Spacer(),
                                  CustomIcon(
                                    AppIcons.edit,
                                    size: 18,
                                    horzontalPadding: 5,
                                    verticalPadding: 5,
                                    onPressed: () {
                                      AppNavigator.push(
                                        AddNewAddress(
                                          addressModel: myAddresses,
                                          editingAddressIndex: index,
                                        ),
                                      );
                                    },
                                  ),
                                  CustomIcon(
                                    AppIcons.delete,
                                    size: 18,
                                    horzontalPadding: 5,
                                    verticalPadding: 5,
                                    onPressed: () async {
                                      await ref.update({
                                        'address': FieldValue.arrayRemove([
                                          address.toJson(),
                                        ]),
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          10.h,
                          Container(
                            padding: const EdgeInsets.all(15),
                            width: .infinity,
                            decoration: BoxDecoration(
                              border: .all(color: AppColors.borderColor),
                              borderRadius: .circular(6),
                            ),
                            child: Text(
                              '${address.name}\n${address.address}, ${address.city}, ${address.state}\n${address.pincode}\n${address.number}\nAddress type: ${address.addressType}',
                              style: context.bodyLarge?.copyWith(
                                color: AppColors.secondaryTextColor,
                                fontWeight: .normal,
                              ),
                            ),
                          ),
                          10.h,
                        ],
                      );
                    },
                  ),
                ),
          bottomNavigationBar: SafeArea(
            child: PrimaryButton(
              label: 'Add a new address',
              onPressed: () {
                AppNavigator.push(const AddNewAddress());
              },
              fontSize: 14,
              borderRadius: 0,
            ),
          ),
        );
      },
    );
  }
}
