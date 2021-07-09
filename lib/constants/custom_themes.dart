import 'package:flutter/material.dart';
import 'package:noted/constants/constants.dart';

class CustomThemes {
  static final darkTheme = ThemeData(
      scaffoldBackgroundColor: Color(0xffb393e42),
      colorScheme: ColorScheme.dark(),
      fontFamily: 'OpenSans',
      brightness: Brightness.dark,
      primaryColor: primaryBlack,
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          primary: Colors.white, // This is a custom color variable
        ),
      ));

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Color(0xffefefef),
    primaryColor: lightGrey,
    colorScheme: ColorScheme.light(),
    fontFamily: 'OpenSans',
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: Colors.black,
      ),
    ),
  );
}
