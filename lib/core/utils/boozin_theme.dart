import 'package:boozinmachinetask/core/constants/colors.dart';
import 'package:boozinmachinetask/core/constants/text_styles.dart';
import 'package:flutter/material.dart';

class BoozinTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: BoozinColors.black,
      hintColor: BoozinColors.iconColor,
      scaffoldBackgroundColor: BoozinColors.iconColor,
      textTheme: _baseTextTheme,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
        primaryColor: BoozinColors.boxGrey,
        scaffoldBackgroundColor: BoozinColors.black,
        textTheme: _baseTextTheme.copyWith(
          bodyLarge: BoozinTextStyles.darkModeText,
          bodyMedium: BoozinTextStyles.darkModeText,
          displayLarge: BoozinTextStyles.darkModeText,
          displayMedium: BoozinTextStyles.darkModeText,
          titleMedium: BoozinTextStyles.darkModeText,
        ));
  }

  static TextTheme get _baseTextTheme {
    return const TextTheme(
      bodyLarge: BoozinTextStyles.regular,
      bodyMedium: BoozinTextStyles.light,
      displayLarge: BoozinTextStyles.largeTitle,
      displayMedium: BoozinTextStyles.bold,
      titleMedium: BoozinTextStyles.subtitle,
    );
  }
}
