import 'package:ciyone_nutrimix/core/utils/page_transition.dart';
import 'package:flutter/material.dart';

enum PageAnimation { fade, slideBToT, slideLToR, slideRToL }

class AppNavigator {
  static final navigatorKey = GlobalKey<NavigatorState>();

  static Future<dynamic>? push(Widget screen, {PageAnimation? pageAnimation, int milliseconds = 400}) {
    return navigatorKey.currentState!.push(switch (pageAnimation) {
      null => slideRToLPageBuilder(screen),
      PageAnimation.fade => fadePageBuilder(screen,milliseconds: milliseconds),
      PageAnimation.slideBToT => slideBToTPageBuilder(screen),
      PageAnimation.slideLToR => slideLToRPageBuilder(screen),
      PageAnimation.slideRToL => slideRToLPageBuilder(screen),
    });
  }

  static Future<dynamic>? pushReplacement(
    Widget screen, {
    PageAnimation? pageAnimation,int milliseconds = 400
  }) {
    return navigatorKey.currentState!.pushReplacement(switch (pageAnimation) {
      null => slideRToLPageBuilder(screen),
      PageAnimation.fade => fadePageBuilder(screen,milliseconds: milliseconds),
      PageAnimation.slideBToT => slideBToTPageBuilder(screen),
      PageAnimation.slideLToR => slideLToRPageBuilder(screen),
      PageAnimation.slideRToL => slideRToLPageBuilder(screen),
    });
  }

  static Future<dynamic>? pushAndRemoveUntil(
    Widget screen, {
    PageAnimation? pageAnimation, int milliseconds = 400
  }) {
    return navigatorKey.currentState!.pushAndRemoveUntil(
      switch (pageAnimation) {
        null => slideRToLPageBuilder(screen),
        PageAnimation.fade => fadePageBuilder(screen,milliseconds: milliseconds),
        PageAnimation.slideBToT => slideBToTPageBuilder(screen),
        PageAnimation.slideLToR => slideLToRPageBuilder(screen),
        PageAnimation.slideRToL => slideRToLPageBuilder(screen),
      },
      (route) => false,
    );
  }

  static void pop([Object? object]) {
    return navigatorKey.currentState!.pop(object);
  }
}
