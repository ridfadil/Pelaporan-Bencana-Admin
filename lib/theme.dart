import 'package:flutter/material.dart';
import 'package:pelaporanbencanaadmin/utils/values/colors.dart';
class AppsTheme{
  static ThemeData lightTheme = ThemeData(
    backgroundColor: MyColor.lightBG,
    primaryColor: MyColor.lightPrimary,
    accentColor:  MyColor.lightAccent,
    cursorColor: MyColor.lightAccent,
    scaffoldBackgroundColor: MyColor.lightBG,
    appBarTheme: AppBarTheme(
      elevation: 0,
      textTheme: TextTheme(
        title: TextStyle(
          color: MyColor.darkBG,
          fontSize: 18.0,
          fontWeight: FontWeight.w800,
        ),
      ),
    ),
  );

  static ThemeData nindyaTheme = ThemeData(
  fontFamily: 'Montserrat',
  primaryColor: MyColor.bgColorNindya,
  bottomAppBarColor: MyColor.colorWhiteNindya,
  brightness: Brightness.light,
  accentColor: MyColor.badgeColor,
      appBarTheme: AppBarTheme(
        elevation: 0,
        textTheme: TextTheme(
          title: TextStyle(
            color: MyColor.darkBG,
            fontSize: 18.0,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
  primaryTextTheme: TextTheme(title: TextStyle(color: MyColor.darkBG)
  )
  );
}