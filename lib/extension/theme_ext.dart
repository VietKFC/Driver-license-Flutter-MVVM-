import 'package:driver_license_test/config/app_colors.dart';
import 'package:flutter/material.dart';

import '../config/app_font.dart';

extension ThemeExt on ThemeData {
  static const TextStyle lightText =
      TextStyle(color: AppColors.whiteGrey, fontFamily: AppFonts.circularStd);

  static const TextStyle darkText =
      TextStyle(color: AppColors.dark, fontFamily: AppFonts.circularStd);

  ThemeData getLightTheme(BuildContext context) {
    return copyWith(
        backgroundColor: AppColors.whiteGrey,
        brightness: Brightness.light,
        appBarTheme: const AppBarTheme(toolbarTextStyle: darkText),
        textTheme: const TextTheme(
            bodyText1: darkText,
            bodyText2: darkText,
            labelMedium: darkText,
            caption: darkText,
            button: darkText),
        scaffoldBackgroundColor: AppColors.whiteGrey);
  }

  ThemeData getDarkTheme(BuildContext context) {
    return copyWith(
        backgroundColor: AppColors.dark,
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(toolbarTextStyle: lightText),
        textTheme: const TextTheme(
            bodyText1: lightText,
            bodyText2: lightText,
            labelMedium: lightText,
            caption: lightText,
            button: lightText),
        scaffoldBackgroundColor: AppColors.dark);
  }
}
