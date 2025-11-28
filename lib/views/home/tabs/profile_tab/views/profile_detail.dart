import 'package:ciyone_nutrimix/core/constants/app_colors.dart';
import 'package:ciyone_nutrimix/core/constants/app_icons.dart';
import 'package:ciyone_nutrimix/core/utils/app_navigator.dart';
import 'package:ciyone_nutrimix/core/utils/sized_box_extension.dart';
import 'package:ciyone_nutrimix/core/utils/theme_extension.dart';
import 'package:ciyone_nutrimix/models/user_model.dart';
import 'package:ciyone_nutrimix/views/widgets/buttons.dart';
import 'package:ciyone_nutrimix/views/widgets/custom_icon.dart';
import 'package:ciyone_nutrimix/views/widgets/custom_text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileDetail extends StatefulWidget {
  const ProfileDetail({super.key});

  @override
  State<ProfileDetail> createState() => _ProfileDetailState();
}

class _ProfileDetailState extends State<ProfileDetail> {
  UserModel profileModel = UserModel();
  ValueNotifier<bool> isEditingProfile = ValueNotifier(false);

  late TextEditingController name;
  late TextEditingController email;
  late TextEditingController phoneNumber;
  late TextEditingController dob;
  ValueNotifier<int> genderIndex = ValueNotifier(-1);
  final List<String> genders = ['Male', 'Female', 'Other'];

  DocumentReference ref = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid);

  @override
  void initState() {
    super.initState();
    name = TextEditingController();
    email = TextEditingController();
    phoneNumber = TextEditingController();
    dob = TextEditingController();
  }

  void updateDetails(newData) async {
    await ref.update(newData);
  }

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    phoneNumber.dispose();
    dob.dispose();

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
          'Personal Details',
          style: context.titleSmall?.copyWith(fontFamily: 'PoppinsBold'),
        ),

        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: AppColors.borderStrokeColor.withValues(alpha: 0.6),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: StreamBuilder(
            stream: ref.snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.data != null || snapshot.data!.exists) {
                UserModel myData = UserModel.fromJson(
                  snapshot.data!.data()! as Map<String,dynamic>,
                );
                name.text = myData.name;
                email.text = myData.email;
                phoneNumber.text = myData.phone;
                genderIndex.value = genders.indexOf(myData.gender);
                dob.text = myData.dob;
              }
              return ValueListenableBuilder(
                valueListenable: isEditingProfile,
                builder: (context, editingProfile, child) {
                  return Column(
                    crossAxisAlignment: .start,
                    children: [
                      _buildTextField(
                        title: 'Full Name',
                        hintText: 'Enter your fullname',
                        controller: name,
                        keyboardType: TextInputType.name,
                        enabled: editingProfile,
                      ),
                      _buildTextField(
                        readOnly: true,
                        title: 'Email Id',
                        hintText: 'Enter your email Id',
                        controller: email,
                        keyboardType: TextInputType.emailAddress,
                        enabled: editingProfile,
                      ),
                      _buildTextField(
                        title: 'Phone Number',
                        hintText: 'Enter your phone number',
                        controller: phoneNumber,
                        keyboardType: TextInputType.phone,
                        enabled: editingProfile,
                        onChanged: (value) {
                          value = value.trim();
                          if (value.length == 1 && value[0] != '+') {
                            phoneNumber.text = '+91 $value';
                          } else if (value.length == 4) {
                            phoneNumber.text =
                                "${value.substring(0, 3)} ${value[value.length - 1]}";
                          } else if (value.length == 10) {
                            phoneNumber.text =
                                "${value.substring(0, 9)} ${value[value.length - 1]}";
                          } else if (value.length > 15) {
                            phoneNumber.text = value.substring(0, 15);
                          } else {
                            phoneNumber.text = value;
                          }
                        },
                      ),
                      15.h,
                      Text('Gender', style: context.bodyLarge),
                      ValueListenableBuilder(
                        valueListenable: genderIndex,
                        builder: (context, value, child) {
                          return Row(
                            children: List.generate(3, (index) {
                              return TextButton.icon(
                                onPressed: editingProfile
                                    ? () {
                                        genderIndex.value = index;

                                        updateDetails({
                                          'gender': genders[genderIndex.value],
                                        });
                                      }
                                    : null,
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.only(right: 20),
                                  textStyle: context.bodyLarge,
                                  foregroundColor: AppColors.primaryTextColor,
                                ),
                                icon: CustomIcon(
                                  index == value
                                      ? AppIcons.activeCircle
                                      : AppIcons.untickCircle,
                                  color: index == value
                                      ? AppColors.stepperActiveColor
                                      : AppColors.secondaryIconColor,
                                ),
                                label: Text(genders[index]),
                              );
                            }),
                          );
                        },
                      ),

                      _buildTextField(
                        title: 'Date of Birth',
                        hintText: 'Enter DOB',
                        controller: dob,
                        required: false,
                        keyboardType: TextInputType.datetime,
                        enabled: editingProfile,
                        suffixIcon: CustomIcon(
                          AppIcons.calendar,
                          horzontalPadding: 15,
                          onPressed: () async {
                            final date = await showDatePicker(
                              context: context,
                              firstDate: DateTime(1920),
                              lastDate: DateTime(2015),
                            );
                            if (date != null) {
                              final dateOfBirth =
                                  '${date.day < 10 ? '0' : ''}${date.day}/${date.month < 10 ? '0' : ''}${date.month}/${date.year}';
                              dob.text = dateOfBirth;
                              profileModel = profileModel.copyWith(
                                dob: dateOfBirth,
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: isEditingProfile,
          builder: (context, editingProfile, child) {
            return PrimaryButton(
              label: editingProfile ? 'Save Changes' : 'Edit profile',
              onPressed: () {
                if (editingProfile) {
                  profileModel = profileModel.copyWith(
                    name: name.text.trim(),
                    dob: dob.text.trim(),
                    phone: phoneNumber.text.trim(),
                  );
                  updateDetails({
                    'name': profileModel.name,
                    'phone': profileModel.phone,
                    'dob': profileModel.dob,
                  });
                }
                isEditingProfile.value = !editingProfile;
              },
              fontSize: 14,
              borderRadius: 0,
            );
          },
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String title,
    CustomIcon? suffixIcon,
    required String hintText,
    required TextEditingController controller,
    required TextInputType keyboardType,
    required bool enabled,
    bool readOnly = false,
    bool required = true,
    Function(String value)? onChanged,
  }) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        15.h,
        RichText(
          text: TextSpan(
            text: title,
            style: context.bodyLarge,
            children: [
              if (required)
                TextSpan(
                  text: '*',
                  style: context.bodyMedium?.copyWith(
                    color: AppColors.stepperActiveColor,
                    fontSize: 16,
                  ),
                ),
            ],
          ),
        ),
        6.h,
        CustomTextField(
          readOnly: readOnly,
          hintText: hintText,
          controller: controller,
          suffixIcon: suffixIcon,
          keyboardType: keyboardType,
          enabled: enabled,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
