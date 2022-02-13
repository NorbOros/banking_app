import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_constants.dart';

class ThemeDataLight {
  static ThemeData getThemeData() {
    return ThemeData(
      colorScheme: const ColorScheme.light(
        surface: ColorConstants.white,
      ),
      fontFamily: GoogleFonts.lato().fontFamily,
      textTheme: ThemeData.light().textTheme.copyWith(
            headline1: const TextStyle(
              color: ColorConstants.white,
              fontSize: 22,
              fontWeight: FontWeight.w400,
            ),
            headline2: const TextStyle(
              color: ColorConstants.black,
              fontSize: 22,
              fontWeight: FontWeight.w400,
            ),
            headline3: const TextStyle(
              color: ColorConstants.black,
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
            headline4: const TextStyle(
              color: ColorConstants.black,
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
            headline5: const TextStyle(
              color: ColorConstants.black,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            headline6: const TextStyle(
              color: ColorConstants.black,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            bodyText1: const TextStyle(
              color: ColorConstants.white,
              fontSize: 19,
              fontWeight: FontWeight.w300,
            ),
            bodyText2: const TextStyle(
              color: ColorConstants.white,
              fontSize: 15,
              fontWeight: FontWeight.w300,
            ),
          ),
    );
  }
}
