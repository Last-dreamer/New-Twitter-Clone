


import 'dart:ui';

import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  //  *************
  //  static colors
  //  *************



  static final Color _darkPrimaryColor =  const  Color(0xff201a31);
  static final Color _darkPrimaryVariantColor =   const Color(0xff96939e);
  static final Color _darkOnPrimaryVariantColor = const Color(0xff38304c);
  static const Color _darkTextColorPrimary = Colors.white;
  static const Color _darkAppColor  = Color(0xff201a31);
  // #0cf4e2
  static const Color _iconColor = Colors.white;
  static const Color _accentColor = Color(0xff0cf4e2);

  // static const Color _accentColor = Color.fromRGBO(74, 217, 217, 1);


//  *************
//  text style - dark
//  *************


static const TextStyle _darkHeadingText = TextStyle(
  color: _darkTextColorPrimary,
  // fontFamily:
  fontSize: 24,
  fontWeight: FontWeight.bold
);

  static const TextStyle _darkBodyText = TextStyle(
      color: _darkTextColorPrimary,
      // fontFamily:
      fontSize: 20,
      fontWeight: FontWeight.bold
  );

  static const TextTheme _darkTextTheme = TextTheme(
    displayLarge: _darkHeadingText,
    bodyLarge: _darkBodyText
  );


//  *************
//  theme dark
//  *************


static final ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: _darkPrimaryColor,
  appBarTheme: const AppBarTheme(
    color: _darkAppColor,
    iconTheme: IconThemeData(color: _iconColor)
  ),
  colorScheme: ColorScheme.dark(
    primary: _darkPrimaryColor,
    secondary:_accentColor,
    onPrimary: _darkPrimaryVariantColor,
    primaryContainer: _darkOnPrimaryVariantColor
  ),
  textTheme: _darkTextTheme,
    bottomAppBarTheme: const BottomAppBarTheme(color: _darkAppColor)
);










}