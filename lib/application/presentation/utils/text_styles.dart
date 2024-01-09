import 'package:flutter/material.dart';
import 'package:movie_app/application/presentation/utils/color_constants.dart';

class TextStyles {
  static const String poppinsFontFamily = 'Poppins';

  static const TextStyle headline1 = TextStyle(
    fontFamily: poppinsFontFamily,
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: ColorConstants.deepPurpleLight,
    letterSpacing: 1.0,
  );

  static const TextStyle headline2 = TextStyle(
    fontFamily: poppinsFontFamily,
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: ColorConstants.deepPurpleLight,
    letterSpacing: 1.0,
  );

  static const TextStyle bodyText1 = TextStyle(
    fontFamily: poppinsFontFamily,
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: ColorConstants.deepPurpleLight,
    letterSpacing: 1.0,
  );

  static const TextStyle bodyText2 = TextStyle(
    fontFamily: poppinsFontFamily,
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: ColorConstants.deepPurpleLight,
    letterSpacing: 1.0,
  );
}
