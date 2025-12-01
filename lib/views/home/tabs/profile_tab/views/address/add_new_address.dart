import 'package:ciyone_nutrimix/core/constants/app_colors.dart';
import 'package:ciyone_nutrimix/core/constants/app_icons.dart';
import 'package:ciyone_nutrimix/core/utils/app_navigator.dart';
import 'package:ciyone_nutrimix/core/utils/theme_extension.dart';
import 'package:ciyone_nutrimix/models/address_model.dart';
import 'package:ciyone_nutrimix/views/home/tabs/profile_tab/views/address/address_fields.dart';
import 'package:ciyone_nutrimix/views/widgets/buttons.dart';
import 'package:ciyone_nutrimix/views/widgets/custom_icon.dart';
import 'package:ciyone_nutrimix/views/widgets/show_app_snackbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddNewAddress extends StatefulWidget {
  const AddNewAddress({super.key, this.addressModel, this.editingAddressIndex});
  final List<AddressModel>? addressModel;
  final int? editingAddressIndex;

  @override
  State<AddNewAddress> createState() => _AddNewAddressState();
}

class _AddNewAddressState extends State<AddNewAddress> {
  AddressModel? address;

  late int addressIndex = 2;
  late List<TextEditingController> addressControllers = [];

  DocumentReference ref = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid);

  @override
  void initState() {
    super.initState();
    if (widget.addressModel != null) {
      address = widget.addressModel![widget.editingAddressIndex ?? 0];
    }
    for (int x = 0; x <= 7; x++) {
      addressControllers.add(TextEditingController());
    }

    if (address != null) {
      addressControllers[0].text = address!.name;
      addressControllers[1].text = address!.emailId;
      addressControllers[2].text = address!.number;
      addressControllers[3].text = address!.address;
      addressControllers[4].text = address!.pincode;
      addressControllers[5].text = address!.city;
      addressControllers[6].text = address!.state;
      addressControllers[7].text = address!.addressType;
    }

    if (address != null) {
      addressIndex = ['Home', 'Office'].indexOf(address!.addressType);
      if (addressIndex == -1) {
        addressIndex = 2;
      }
    }
  }

  void updateAddress(AddressModel newAddress) async {
    List<AddressModel> updatedAddresses = widget.addressModel!;
    updatedAddresses.remove(address);
    updatedAddresses.insert(widget.editingAddressIndex!, newAddress);
    try {
      await ref.update({
        'address': FieldValue.arrayRemove([address!.toJson()]),
      });
      await ref.update({
        'address': updatedAddresses
            .map((AddressModel addressModel) => addressModel.toJson())
            .toList(),
      });
      if (!mounted) return;
      showAppSnackbar(
        context: context,
        message: 'Address updated successfully...',
      );
      AppNavigator.pop();
    } on FirebaseException catch (err) {
      showAppSnackbar(
        context: context,
        message: err.message ?? 'Unknown error occured',
        snackBarType: SnackBarType.error,
      );
    }
  }

  void addNewAddress(AddressModel newAddress) async {
    try {
      await ref.update({
        'address': FieldValue.arrayUnion([newAddress.toJson()]),
      });
      if (!mounted) return;
      showAppSnackbar(
        context: context,
        message: 'Address added successfully...',
      );
      AppNavigator.pop();
    } on FirebaseException catch (err) {
      showAppSnackbar(
        context: context,
        message: err.message ?? 'Unknown error occured',
        snackBarType: SnackBarType.error,
      );
    }
  }

  @override
  void dispose() {
    for (TextEditingController controller in addressControllers) {
      controller.dispose();
    }
    super.dispose();
  }

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
          'New Address',
          style: context.titleSmall?.copyWith(fontFamily: 'PoppinsBold'),
        ),

        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: AppColors.borderStrokeColor.withValues(alpha: 0.6),
          ),
        ),
      ),
      body: AddressFields(
        addressControllers: addressControllers,
        addressTypeIndex: addressIndex,
      ),
      bottomNavigationBar: SafeArea(
        child: PrimaryButton(
          label: address != null ? 'Update address' : 'Save address',
          onPressed: () {
            List<bool> canPop = [];
            List addressData = [];
            for (TextEditingController x in addressControllers) {
              if (x.text.isEmpty) {
                canPop.add(false);
              } else {
                addressData.add(x.text.trim());
                canPop.add(true);
              }
            }
            if (canPop.contains(false)) {
              showAppSnackbar(
                context: context,
                snackBarType: SnackBarType.error,
                message: 'All fields are required',
              );
            } else {
              AddressModel newAddress = AddressModel(
                name: addressData[0],
                emailId: addressData[1],
                number: addressData[2],
                address: addressData[3],
                pincode: addressData[4],
                city: addressData[5],
                state: addressData[6],
                addressType: addressData[7],
              );
              if (address == null) {
                addNewAddress(newAddress);
              } else {
                updateAddress(newAddress);
              }
            }
          },
          fontSize: 14,
          borderRadius: 0,
        ),
      ),
    );
  }
}
