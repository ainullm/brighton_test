import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';
import 'app_text_style.dart';

class AppTheme {
  static final AppTextStyle textStyle = AppTextStyle.instance;

  static ThemeData light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: primaryColor,
    dialogBackgroundColor: white,
    scaffoldBackgroundColor: white,
    // primarySwatch: createMaterialColor(primaryColor),
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: createMaterialColor(primaryColor),
    ).copyWith(brightness: Brightness.light),

    textTheme: TextTheme(
      bodyLarge: textStyle.bodyLarge,
      bodyMedium: textStyle.bodyMedium,
      bodySmall: textStyle.bodySmall,
      displayLarge: textStyle.displayLarge,
      displayMedium: textStyle.displayMedium,
      displaySmall: textStyle.displaySmall,
      headlineLarge: textStyle.headLineLarge,
      headlineMedium: textStyle.headLineMedium,
      headlineSmall: textStyle.headLineSmall,
      titleLarge: textStyle.titleLarge,
      titleMedium: textStyle.titleMedium,
      titleSmall: textStyle.titleSmall,
      labelLarge: textStyle.labelLarge,
      labelMedium: textStyle.labelMedium,
      labelSmall: textStyle.labelSmall,
    ),
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      actionsIconTheme: IconThemeData(
        color: black1,
      ),
    ),
  );

  static ThemeData dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: primaryColor,
    dialogBackgroundColor: black1,
    scaffoldBackgroundColor: black1,
    // primarySwatch: createMaterialColor(primaryColor),
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: createMaterialColor(primaryColor),
    ).copyWith(brightness: Brightness.dark),
    textTheme: TextTheme(
      bodyLarge: textStyle.bodyLarge.copyWith(color: white),
      bodyMedium: textStyle.bodyMedium.copyWith(color: white),
      bodySmall: textStyle.bodySmall.copyWith(color: white),
      displayLarge: textStyle.displayLarge.copyWith(color: white),
      displayMedium: textStyle.displayMedium.copyWith(color: white),
      displaySmall: textStyle.displaySmall.copyWith(color: white),
      headlineLarge: textStyle.headLineLarge.copyWith(color: white),
      headlineMedium: textStyle.headLineMedium.copyWith(color: white),
      headlineSmall: textStyle.headLineSmall.copyWith(color: white),
      titleLarge: textStyle.titleLarge.copyWith(color: white),
      titleMedium: textStyle.titleMedium.copyWith(color: white),
      titleSmall: textStyle.titleSmall.copyWith(color: white),
      labelLarge: textStyle.labelLarge.copyWith(color: white),
      labelMedium: textStyle.labelMedium.copyWith(color: white),
      labelSmall: textStyle.labelSmall.copyWith(color: white),
    ),
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.light,
      actionsIconTheme: IconThemeData(
        color: white,
      ),
    ),
  );
}

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }

  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }

  return MaterialColor(color.value, swatch);
}
