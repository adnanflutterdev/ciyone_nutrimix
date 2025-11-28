import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {
  /// Access the current TextTheme easily
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// Headline Styles
  TextStyle? get headlineLarge => textTheme.headlineLarge;
  TextStyle? get headlineMedium => textTheme.headlineMedium;

  /// Title Styles
  TextStyle? get titleLarge => textTheme.titleLarge;
  TextStyle? get titleMedium => textTheme.titleMedium;
  TextStyle? get titleSmall => textTheme.titleSmall;

  /// Body Styles
  TextStyle? get bodyLarge => textTheme.bodyLarge;
  TextStyle? get bodyMedium => textTheme.bodyMedium;
  TextStyle? get bodySmall => textTheme.bodySmall;

  /// Label Styles
  TextStyle? get labelLarge => textTheme.labelLarge;

  /// for text field decoration
  InputDecorationThemeData? get inputDecoration => Theme.of(this).inputDecorationTheme;
}
