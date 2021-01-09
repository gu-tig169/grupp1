import 'package:flutter/material.dart';

class AppTheme {
  //the app's different colors

  //dark green
  static const primaryColor = Color(0xFF003300);
  //yellow
  static const primaryTextColor = Color(0xFFF9A825);

  //light green
  static const iconColor = Color(0xFF4C8C4A);
  //green
  static const backgroundColor = Color(0xFF1B5E20);
  //green
  static const secondaryTextColor = Color(0xFF042D04);
  //purple
  static const secondaryColor = Color(0xFF4A148C);
  //light green
  static const hintColor = Color(0xFF58A056);

  //The app's different fontsizes
  static const smallFontSize = 15.0;
  static const normalFontSize = 18.0;
  static const normalHeaderFontSize = 25.0;
  static const largeHeaderFontSize = 35.0;

  //static const fontStyle = 'Roboto';

  static final ThemeData materialTheme = ThemeData(
    scaffoldBackgroundColor: backgroundColor,
    splashColor: Colors.blue.withAlpha(30),
    bottomNavigationBarTheme:
        BottomNavigationBarThemeData(backgroundColor: primaryColor),
    iconTheme: IconThemeData(color: iconColor, size: 30.0),
    //iconTheme: IconThemeData(color: secondaryColor),
    buttonTheme: ButtonThemeData(
      buttonColor: secondaryColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
    ),
    cardTheme: CardTheme(
      color: primaryColor,
      //shadowColor?
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
    ),
    // dividerTheme: DividerThemeData(endIndent: 10.0),
    inputDecorationTheme: InputDecorationTheme(
        fillColor: Colors.white,
        hintStyle: TextStyle(
            fontWeight: FontWeight.normal,
            color: hintColor,
            fontSize: smallFontSize)
        //focusedBorder: InputBorder(borderSide: BorderSide( width: 3.0, color: onBackgroundColor)),

        ),
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
