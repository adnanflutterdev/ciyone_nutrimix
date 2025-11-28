import 'package:ciyone_nutrimix/views/home/home_screen.dart';
import 'package:ciyone_nutrimix/views/widgets/show_app_snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ciyone_nutrimix/core/constants/app_colors.dart';
import 'package:ciyone_nutrimix/core/constants/app_icons.dart';
import 'package:ciyone_nutrimix/core/constants/app_images.dart';
import 'package:ciyone_nutrimix/core/utils/app_navigator.dart';
import 'package:ciyone_nutrimix/core/utils/screen_size.dart';
import 'package:ciyone_nutrimix/core/utils/sized_box_extension.dart';
import 'package:ciyone_nutrimix/core/utils/theme_extension.dart';
import 'package:ciyone_nutrimix/views/auth/sign_up_screen.dart';
import 'package:ciyone_nutrimix/views/widgets/buttons.dart';
import 'package:ciyone_nutrimix/views/widgets/custom_icon.dart';
import 'package:ciyone_nutrimix/views/widgets/custom_text_form_field.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool isObscure = true;
  bool isChecked = false;

  bool isLoggingIn = false;

  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void navigateToSignUpScreen() {
    AppNavigator.pushReplacement(
      const SignUpScreen(),
      pageAnimation: PageAnimation.slideBToT,
    );
  }

  void login() async {
    setState(() {
      isLoggingIn = true;
    });
    if (formKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );

        if (!mounted) return;
        showAppSnackbar(
          context: context,
          snackBarType: SnackBarType.success,
          message: 'You logged in successfully...',
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
      isLoggingIn = false;
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
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
                        AppImages.signInScreenBg,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Positioned(
                      left: 25,
                      bottom: 8,
                      child: Text('Sign in', style: context.headlineMedium),
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
                    Text('Email', style: context.titleSmall),
                    CustomTextFormField(
                      hintText: 'demo@email.com',
                      controller: emailController,
                      prefixIcon: const CustomIcon(AppIcons.mail),
                      formValidator: FormValidator.email,
                    ),
                    25.h,
                    CustomTextFormField(
                      isObscure: isObscure,
                      controller: passwordController,
                      hintText: 'Enter your password',
                      prefixIcon: const CustomIcon(AppIcons.password),
                      formValidator: FormValidator.password,
                      suffixIcon: CustomIcon(
                        isObscure ? AppIcons.viewOff : AppIcons.view,
                        color: isObscure
                            ? AppColors.primaryIconColor
                            : AppColors.primary,
                        onPressed: () {
                          setState(() {
                            isObscure = !isObscure;
                          });
                        },
                      ),
                    ),
                    25.h,
                    Row(
                      children: [
                        CustomIcon(
                          onPressed: () {
                            setState(() {
                              isChecked = !isChecked;
                            });
                          },
                          isChecked
                              ? AppIcons.tickSquare
                              : AppIcons.untickSquare,
                          size: 20,
                          color: isChecked
                              ? AppColors.primary
                              : AppColors.secondaryIconColor,
                        ),
                        8.w,
                        Text(
                          'Remember Me',
                          style: context.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          'Forget Password?',
                          style: context.bodyLarge?.copyWith(
                            fontFamily: 'PoppinsBold',
                            color: AppColors.textButtonColor,
                          ),
                        ),
                      ],
                    ),
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
                isLoading: isLoggingIn ? true : null,
                label: 'Login',
                onPressed: () => login(),
              ),
            ),
            RichText(
              text: TextSpan(
                text: 'Don\'t have an account? ',
                style: context.bodyLarge?.copyWith(
                  color: AppColors.secondaryTextColor,
                ),
                children: [
                  TextSpan(
                    text: 'Sign up',
                    style: context.bodyLarge?.copyWith(
                      color: AppColors.textButtonColor,
                      fontFamily: 'PoppinsBold',
                      fontSize: 15,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => navigateToSignUpScreen(),
                  ),
                ],
              ),
            ),
            30.h,
          ],
        ),
      ),
    );
  }
}
