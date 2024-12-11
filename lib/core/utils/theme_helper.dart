import 'package:flutter/material.dart';

class ThemeHelpers {
  /// Returns the appropriate icon path based on the current theme brightness.
  static String getThemeSpecificIcon(
    BuildContext context,
    String lightThemeIcon,
    String darkThemeIcon,
  ) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkThemeIcon
        : lightThemeIcon;
  }
}
