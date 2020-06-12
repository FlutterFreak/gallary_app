import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static Color primaryColor = Colors.purple;
  static Color primaryDarkColor = Colors.grey;
  static const Color secondaryColor = Color(0xFFFFFFFF);
  static Color accentColor = Colors.blue[800];
  static const Color accentDarkColor = Color(0xFFd8414d);
  static Color appBackgroundColor = Colors.white;
  static const Color hintColor = Color(0xFFB7B7B7);
  static const Color textLightBlackColor = Colors.black54;
  static const Color textDarkGreyColor = Color(0xFF848484);
  static const Color textLightGreyColor = Color(0xFF707070);
  static const Color textLightGreenColor = Color(0xFF088108);
  static const Color socialMediaIconColor = Color(0xFF19257C);
  static const Color indigoColor = Color(0xFFD3D3FF);

  static final ThemeData appTheme = ThemeData(
      scaffoldBackgroundColor: AppTheme.appBackgroundColor,
      brightness: Brightness.light,
      primaryColor: primaryColor,
      accentColor: accentColor,
      canvasColor: secondaryColor,
      errorColor: textLightGreenColor,
      fontFamily: 'Lato');
}
