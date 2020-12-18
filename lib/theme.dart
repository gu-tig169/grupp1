import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  //The color dispayed most frequently across your app's screens and components
  static const primaryColor = Color(003300);
  //A color that's clearly legible when drawn on primary.
  static const onPrimaryColor = Color(0xFFF9A825);
  //An accent color that when used sparringly calls attention to parts of your app
  static const secondaryColor = Color(0xFF4A148C);
  //A color that typically appears behind scrollable content.
  static const backgroundColor = Color(0xFF1B5E20);
  //A color that's clearly legible when drawn on background
  static const onBackgroundColor = Color(0xFF4C8C4A);
  // the background color for widgets like cards
  static const surfaceColor = Color(0xFF003300);
  //The color to use for hint text or placeholder text, e.g. in TextField fields.
  static const hintColor = Color(0xFF58A056);

  //The app's different fontsizes
  static const smallFontSize = 14;
  static const normalFontSize = 16;
  static const normalHeaderFontSize = 24;
  static const largHeaderFontSize = 34;

  static const fontStyle = 'Roboto';

  static final ThemeData materialTheme = ThemeData(
    bottomAppBarTheme: BottomAppBarTheme(color: primaryColor),
    primaryIconTheme: IconThemeData(color: onPrimaryColor),
    iconTheme: IconThemeData(color: onBackgroundColor),
    buttonTheme: ButtonThemeData(
      buttonColor: onPrimaryColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
    ),
    cardTheme: CardTheme(
      color: surfaceColor,
      //shadowColor?
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
    ),
    colorScheme: ColorScheme.dark(
      primary: primaryColor,
      onPrimary: onPrimaryColor,
      secondary: secondaryColor,
      background: backgroundColor,
      onBackground: onBackgroundColor,
      surface: surfaceColor,
    ),
    textTheme: TextTheme(
      // green font, bold
      bodyText1: TextStyle(
        fontWeight: FontWeight.bold,
        color: onBackgroundColor,
      ),

      //lightgreen font, regular
      bodyText2: TextStyle(
        fontWeight: FontWeight.normal,
        color: hintColor,
      ),

      // yellow font, regular
      subtitle1: TextStyle(
        fontWeight: FontWeight.normal,
        color: onPrimaryColor,
      ),

      // green font, medium
      subtitle2: TextStyle(
        fontWeight: FontWeight.w500,
        color: onBackgroundColor,
      ),

      //yellow font, bold
      headline4: TextStyle(
        fontWeight: FontWeight.bold,
        color: onPrimaryColor,
      ),
    ),
  );
}
