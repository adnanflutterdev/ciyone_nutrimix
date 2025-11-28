import 'package:flutter/widgets.dart';

Route fadePageBuilder(Widget page,{required int milliseconds}) => PageRouteBuilder(
  transitionDuration: Duration(milliseconds: milliseconds),
  pageBuilder: (context, animation, secondaryAnimation) {
    final tween = Tween<double>(begin: 0, end: 1);
    final fadeTransition = animation.drive(tween);
    return FadeTransition(opacity: fadeTransition, child: page);
  },
);

Route slideBToTPageBuilder(Widget page) => PageRouteBuilder(
  transitionDuration: const Duration(milliseconds: 500),
  pageBuilder: (context, animation, secondaryAnimation) {
    final tween = Tween<Offset>(
      begin: const Offset(0, 1),
      end: const Offset(0, 0),
    );
    final slideTransition = animation.drive(tween);
    return SlideTransition(position: slideTransition, child: page);
  },
);

Route slideLToRPageBuilder(Widget page) => PageRouteBuilder(
  transitionDuration: const Duration(milliseconds: 400),
  pageBuilder: (context, animation, secondaryAnimation) {
    final tween = Tween<Offset>(
      begin: const Offset(-1, 0),
      end: const Offset(0, 0),
    );
    final slideTransition = animation.drive(tween);
    return SlideTransition(position: slideTransition, child: page);
  },
);

Route slideRToLPageBuilder(Widget page) => PageRouteBuilder(
  transitionDuration: const Duration(milliseconds: 400),
  pageBuilder: (context, animation, secondaryAnimation) {
    final tween = Tween<Offset>(
      begin: const Offset(1, 0),
      end: const Offset(0, 0),
    );
    final slideTransition = animation.drive(tween);
    return SlideTransition(position: slideTransition, child: page);
  },
);
