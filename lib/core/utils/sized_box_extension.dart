import 'package:flutter/widgets.dart';

extension SizedBoxExtension on int {
  SizedBox get w => SizedBox(width: toDouble());
  SizedBox get h => SizedBox(height: toDouble());
}
