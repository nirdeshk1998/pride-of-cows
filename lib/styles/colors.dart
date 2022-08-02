import 'package:flutter/material.dart';

class Palette {
  static const primaryColor = Color(0xFF193B61);
  static const onPrimaryColor = Color(0xFFf2f2f2);

  static const scaffoldBackgroundColor = Color(0xFFFFFFFF);

  static const backgroundColor = Color(0xFFF7F7F7);
  static const outlineColor = Color(0xFFE1EAF4);

  static const surfaceColor = Color(0xFFE5E5E5);
  static const secondarySurfaceColor = Color(0xffeef9ff);

  static const secondaryColor = Color(0xff3c9f77);

  static const textColor = Color(0xFF2B2B2B);
  static const lightTextColor = Color(0xFF9B9B9B);
  static const lightTextColor2 = Color(0xFF658395);
  static const altTextColor = Color(0xFFf2f2f2);

  static const hintColor = Color(0xFF808080);

  static const disabledColor = Color(0xFFf2f2f2);
  static const onDisabledColor = Color(0xFFA6A6A6);

  static const lightIconColor = Color(0xFFC0C0C0);
  static const goldenIconColor = Color(0xFFD2AB68);
  static const orangeIconColor = Color(0xFFDD772F);

  static const surfaceBackgroundColor = Color(0xFFEAF7FE);

  static const successColor = Color(0xFF6FCF97);
  static const success2Color = Color(0xFF219653);
  static const selectedTabColor = Color(0xFFE3F6FC);

  static const deliveredColor = secondaryColor;
  static const upcomingColor = primaryColor;
  static const vacationColor = Color(0xFFE2C29B);
  static const cancelledColor = Color(0xFFF2858A);
}

class MaterialPalette {
  static const MaterialColor primary = MaterialColor(_primaryPrimaryValue, <int, Color>{
    50: Color(0xFFE3E7EC),
    100: Color(0xFFBAC4D0),
    200: Color(0xFF8C9DB0),
    300: Color(0xFF5E7690),
    400: Color(0xFF3C5879),
    500: Color(_primaryPrimaryValue),
    600: Color(0xFF163559),
    700: Color(0xFF122D4F),
    800: Color(0xFF0E2645),
    900: Color(0xFF081933),
  });
  static const int _primaryPrimaryValue = 0xFF193B61;

  static const MaterialColor primaryAccent = MaterialColor(_primaryAccentValue, <int, Color>{
    100: Color(0xFF6D9CFF),
    200: Color(_primaryAccentValue),
    400: Color(0xFF0757FF),
    700: Color(0xFF004CEC),
  });
  static const int _primaryAccentValue = 0xFF3A7AFF;
}
