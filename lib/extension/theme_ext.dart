import 'package:flutter/material.dart';

import '../config/app_font.dart';
import '../constant/Constant.dart';

extension ThemeExt on ThemeData {
  static const TextStyle lightText =
      TextStyle(color: AppConstant.whiteGrey, fontFamily: AppFonts.circularStd);

  static const TextStyle darkText =
      TextStyle(color: AppConstant.dark, fontFamily: AppFonts.circularStd);

  ThemeData getLightTheme(BuildContext context) {
    return copyWith(
        backgroundColor: AppConstant.whiteGrey,
        brightness: Brightness.light,
        appBarTheme: const AppBarTheme(toolbarTextStyle: darkText),
        textTheme: const TextTheme(
            bodyText1: darkText,
            bodyText2: darkText,
            labelMedium: darkText,
            caption: darkText,
            button: darkText),
        scaffoldBackgroundColor: AppConstant.whiteGrey);
  }

  ThemeData getDarkTheme(BuildContext context) {
    return copyWith(
        backgroundColor: AppConstant.dark,
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(toolbarTextStyle: lightText),
        textTheme: const TextTheme(
            bodyText1: lightText,
            bodyText2: lightText,
            labelMedium: lightText,
            caption: lightText,
            button: lightText),
        scaffoldBackgroundColor: AppConstant.dark);
  }
}
