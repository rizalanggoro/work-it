import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UIUtils {
  static Color backgroundColor(BuildContext context) {
    final isDark = context.theme.brightness == Brightness.dark;
    final colorScheme = context.theme.colorScheme;

    return isDark ? Colors.black : colorScheme.background;
  }
}
