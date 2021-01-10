import 'package:flutter/material.dart';

class AppTheme {
  static const primaryColor = Color(0xFF003300);
  static const buttonColor = Color(0xFF4A148C);
  static const primaryTextColor = Color(0xFFF9A825);
  static const secondaryTextColor = Color(0xFF042D04);
  static const hintTextColor = Color(0xFF58A056);
  static const backgroundColor = Color(0xFF1B5E20);
  static const iconColor = Color(0xFF4C8C4A);

  //The app's different fontsizes
  static const smallFontSize = 15.0;
  static const normalFontSize = 18.0;
  static const normalHeaderFontSize = 25.0;
  static const largeHeaderFontSize = 35.0;

  static final ThemeData materialTheme = ThemeData(
    scaffoldBackgroundColor: backgroundColor,
    splashColor: Colors.blue.withAlpha(30),
    bottomNavigationBarTheme:
        BottomNavigationBarThemeData(backgroundColor: primaryColor),
    iconTheme: IconThemeData(color: iconColor, size: 30.0),
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(backgroundColor: buttonColor),

    //iconTheme: IconThemeData(color: buttonColor),
    buttonTheme: ButtonThemeData(
      buttonColor: buttonColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
    ),
    cardTheme: CardTheme(
      color: primaryColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
    ),
    inputDecorationTheme: InputDecorationTheme(
        fillColor: Colors.white,
        hintStyle: TextStyle(
            fontWeight: FontWeight.normal,
            color: hintTextColor,
            fontSize: smallFontSize)),
    textTheme: TextTheme(
      // green font, bold
      bodyText1: TextStyle(
        fontWeight: FontWeight.bold,
        color: secondaryTextColor,
      ),

      //light green font, regular
      bodyText2: TextStyle(
        fontWeight: FontWeight.normal,
        color: iconColor,
      ),

      // yellow font, regular
      subtitle1: TextStyle(
        fontWeight: FontWeight.normal,
        color: primaryTextColor,
      ),

      // green font, medium
      subtitle2: TextStyle(
        fontWeight: FontWeight.w500,
        color: secondaryTextColor,
      ),

      //yellow font, bold
      headline4: TextStyle(
        fontWeight: FontWeight.bold,
        color: primaryTextColor,
      ),
    ),
  );
}
