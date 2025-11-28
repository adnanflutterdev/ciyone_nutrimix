import 'package:ciyone_nutrimix/views/auth/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:ciyone_nutrimix/core/utils/app_navigator.dart';
import 'package:flutter/services.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  // Backgrounds
  final String initialBg = 'assets/bg/splash_bg_1.png';
  final String finalBg = 'assets/bg/splash_bg_2.png';
  final String logo = 'assets/logo/ciyoneNutrimix.png';

  late AnimationController controller1;
  late AnimationController controller2;
  late Animation<double> fadeAnim;
  late Animation<double> scaleAnim;
  String bg = "";

  @override
  void initState() {
    super.initState();
        SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    bg = initialBg;

    controller1 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    controller2 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    fadeAnim = Tween<double>(begin: 0, end: 0.8).animate(controller1);
    scaleAnim = Tween<double>(
      begin: 0.8,
      end: 1,
    ).animate(CurvedAnimation(parent: controller1, curve: Curves.easeOutBack));

    controller1.forward();

    controller1.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _changeBackground();
        fadeAnim = Tween<double>(begin: 0.5, end: 1).animate(controller2);
        controller2.forward();
      }
    });

    controller2.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _navigate();
      }
    });
  }

  Future<void> _changeBackground() async {
    setState(() => bg = finalBg);
  }

  Future<void> _navigate() async {
    Future.delayed(const Duration(milliseconds: 100), () {
      AppNavigator.pushReplacement(
        const AuthScreen(),
        // const HomeScreen(),
        pageAnimation: PageAnimation.fade,
      );
    });
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: Stack(
            alignment: Alignment.center,
            children: [
              FadeTransition(
                opacity: fadeAnim,
                child: Image.asset(bg, fit: BoxFit.cover),
              ),
              ScaleTransition(scale: scaleAnim, child: Image.asset(logo)),
            ],
          ),
        ),
      ),
    );
  }
}
