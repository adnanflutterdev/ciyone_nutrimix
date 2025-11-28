import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ciyone_nutrimix/views/widgets/buttons.dart';
import 'package:ciyone_nutrimix/views/home/home_screen.dart';
import 'package:ciyone_nutrimix/core/utils/screen_size.dart';
import 'package:ciyone_nutrimix/core/constants/app_icons.dart';
import 'package:ciyone_nutrimix/core/utils/app_navigator.dart';
import 'package:ciyone_nutrimix/core/constants/app_colors.dart';
import 'package:ciyone_nutrimix/core/constants/app_images.dart';
import 'package:ciyone_nutrimix/views/auth/sign_in_screen.dart';
import 'package:ciyone_nutrimix/views/widgets/custom_icon.dart';
import 'package:ciyone_nutrimix/core/utils/theme_extension.dart';
import 'package:ciyone_nutrimix/core/utils/sized_box_extension.dart';
import 'package:ciyone_nutrimix/views/widgets/show_app_snackbar.dart';
import 'package:ciyone_nutrimix/views/widgets/custom_text_form_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isObscure1 = true;
  bool isObscure2 = true;
  bool isChecked = false;

  bool isSigningUp = false;

  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();

  void navigateToSignInScreen() {
    AppNavigator.pushReplacement(
      const SignInScreen(),
      pageAnimation: PageAnimation.slideBToT,
    );
  }

  void signUp() async {
    setState(() {
      isSigningUp = true;
    });
    if (formKey.currentState!.validate()) {
      try {
        final user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.user!.uid)
            .set({
              'name': nameController.text.trim(),
              'email': emailController.text.trim(),
              'phone': phoneController.text.trim(),
              'gender': '',
              'dob': '',
              'address': [],
              'addressIndex': -1,
              'myOrders': [],
              'wishlist': [],
              'cart': [],
            });
        if (!mounted) return;
        showAppSnackbar(
          context: context,
          snackBarType: SnackBarType.success,
          message: 'Account created successfully...',
        );
        AppNavigator.pushReplacement(
          const HomeScreen(),
          pageAnimation: PageAnimation.fade,
        );
      } on FirebaseAuthException catch (err) {
        if (!mounted) return;
        showAppSnackbar(
          context: context,
          snackBarType: SnackBarType.error,
          message: err.message ?? 'Unknown error occured',
        );
      }
    }
    setState(() {
      isSigningUp = false;
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // BG image and Signin text
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: ScreenSize.width,
                      child: Image.asset(
                        AppImages.signUpScreenBg,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Positioned(
                      left: 25,
                      bottom: 8,
                      child: Text('Sign up', style: context.headlineMedium),
                    ),
                    Positioned(
                      left: 25,
                      bottom: 2,
                      child: Container(
                        width: 80,
                        height: 3,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            40.h,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Name', style: context.titleSmall),
                    CustomTextFormField(
                      hintText: 'Enter your name',
                      controller: nameController,
                      prefixIcon: const CustomIcon(AppIcons.user),
                      formValidator: FormValidator.name,
                    ),
                    25.h,
                    Text('Email', style: context.titleSmall),
                    CustomTextFormField(
                      hintText: 'demo@email.com',
                      controller: emailController,
                      prefixIcon: const CustomIcon(AppIcons.mail),
                      formValidator: FormValidator.email,
                    ),
                    25.h,
                    Text('Phone no', style: context.titleSmall),
                    CustomTextFormField(
                      hintText: '+00 00000 00000',
                      controller: phoneController,
                      formValidator: FormValidator.phone,
                      prefixIcon: const CustomIcon(AppIcons.phone),
                    ),

                    25.h,
                    Text('Password', style: context.titleSmall),
                    CustomTextFormField(
                      isObscure: isObscure1,
                      controller: passwordController,
                      hintText: 'Enter your password',
                      prefixIcon: const CustomIcon(AppIcons.password),
                      formValidator: FormValidator.password,
                      suffixIcon: CustomIcon(
                        isObscure1 ? AppIcons.viewOff : AppIcons.view,
                        color: isObscure1
                            ? AppColors.primaryIconColor
                            : AppColors.primary,
                        onPressed: () {
                          setState(() {
                            isObscure1 = !isObscure1;
                          });
                        },
                      ),
                    ),
                    25.h,
                    Text('Confirm Password', style: context.titleSmall),
                    CustomTextFormField(
                      isObscure: isObscure2,
                      prefixIcon: const CustomIcon(AppIcons.password),
                      suffixIcon: CustomIcon(
                        isObscure2 ? AppIcons.viewOff : AppIcons.view,
                        color: isObscure2
                            ? AppColors.primaryIconColor
                            : AppColors.primary,
                        onPressed: () {
                          setState(() {
                            isObscure2 = !isObscure2;
                          });
                        },
                      ),
                      hintText: 'Confirm your password',
                      formValidator: FormValidator.confirmPassword,
                      password: passwordController.text.trim(),
                    ),

                    30.h,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25.0,
                vertical: 20.0,
              ),
              child: PrimaryButton(
                isLoading: isSigningUp ? true : null,
                label: 'Create Account',
                onPressed: () => signUp(),
              ),
            ),
            RichText(
              text: TextSpan(
                text: 'Already have an account! ',
                style: context.bodyLarge?.copyWith(
                  color: AppColors.secondaryTextColor,
                ),
                children: [
                  TextSpan(
                    text: 'Sign in',
                    style: context.bodyLarge?.copyWith(
                      color: AppColors.textButtonColor,
                      fontFamily: 'PoppinsBold',
                      fontSize: 15,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => navigateToSignInScreen(),
                  ),
                ],
              ),
            ),
            25.h,
          ],
        ),
      ),
    );
  }
}
