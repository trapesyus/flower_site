import 'package:flutter/material.dart';
import '../constants/color_constants.dart';

class CustomLightTheme {
  static ThemeData myLightTheme() => ThemeData(
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: ColorConstants.blackColor),
        iconButtonTheme: IconButtonThemeData(
            style: ButtonStyle(
                backgroundColor: MaterialStateColor.resolveWith(
                    (states) => ColorConstants.blackColor))),
        scaffoldBackgroundColor: ColorConstants.whiteColor,
      );
}
