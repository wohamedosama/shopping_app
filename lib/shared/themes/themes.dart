import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../constant.dart';

ThemeData darkTheme = ThemeData(
  fontFamily: 'Titillium_Web',
  primarySwatch: defaultColor,
  // floatingActionButtonTheme: const FloatingActionButtonThemeData(
  //   backgroundColor: defaultColor,
  // ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: HexColor('333739'),
      type: BottomNavigationBarType.fixed,
      selectedItemColor: defaultColor,
      unselectedItemColor: Colors.grey,
      elevation: 20.0),
  scaffoldBackgroundColor: HexColor('333739'),
  appBarTheme: AppBarTheme(
    backgroundColor: HexColor('333739'),
    elevation: 0,
    titleSpacing: 20,
    iconTheme: const IconThemeData(color: Colors.white),
    titleTextStyle: const TextStyle(
      fontSize: 25,
      color: Colors.white,
      fontWeight: FontWeight.w400,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: HexColor('333739'),
      statusBarIconBrightness: Brightness.light,
    ),
  ),
  textTheme: const TextTheme(
    bodySmall: TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
  ),
);
ThemeData lightTheme = ThemeData(
  fontFamily: 'Titillium_Web',
  primarySwatch: defaultColor,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    elevation: 20,
    selectedItemColor: defaultColor,
    unselectedItemColor: Colors.grey,
  ),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0,
    titleSpacing: 20,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.white,
    ),
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w400,
      fontSize: 28,
    ),
  ),
  textTheme: const TextTheme(
    bodySmall: TextStyle(
      color: Colors.black,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
  ),
);
