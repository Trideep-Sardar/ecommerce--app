import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MyThemes {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      brightness: Brightness.light,
      accentColor: deepblack,
      cardColor: smokeWhite,
      splashColor: deepGrey,
      buttonColor: darkBlue,
      focusColor: darkRed,
      highlightColor: lightColor,
      primaryColor: Color.fromRGBO(25, 25, 112, 1),
      canvasColor: lightColor,
      dividerColor: smokeWhite,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        textTheme: Theme.of(context).textTheme,
      ));

  static ThemeData darkTheme(BuildContext context) => ThemeData(
      brightness: Brightness.dark,
      accentColor: smokeWhite,
      buttonColor: lightBlue,
      dividerColor: deepGrey,
      splashColor: darkyellow,
      focusColor: darkyellow,
      cardColor: deepblack,
      highlightColor: deepblack,
      primaryColor: deepblack,
      canvasColor: deepGrey,
      appBarTheme: AppBarTheme(
        backgroundColor: deepblack,
        iconTheme: IconThemeData(color: Colors.white),
        textTheme: Theme.of(context).textTheme,
      ));

  static Color lightColor = Color(0xfff5f5ff);
  static Color darkBlue = Vx.blue900;
  static Color deepblack = Vx.black;
  static Color smokeWhite = Vx.white;
  static Color deepGrey = Vx.gray800;
  static Color lightBlue = Vx.blue100;
  static Color darkRed = Vx.red900;
  static Color darkyellow = Vx.yellow400;
}
