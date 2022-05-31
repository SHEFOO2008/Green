import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:green/shared/styles/colors.dart';

ThemeData darkTheme = ThemeData(
  //  scaffoldBackgroundColor: HexColor('333739'),
  primarySwatch: buildMaterialColor(const Color(0xFF00AF19)),
  appBarTheme: const AppBarTheme(
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: const IconThemeData(
        color: Colors.white
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      //  statusBarColor: HexColor('333739'),
        statusBarIconBrightness: Brightness.light
    ),
    // backgroundColor: HexColor('333739'),
    elevation: 0.0,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: greenColor,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: greenColor,
    unselectedItemColor: Colors.grey,
    elevation: 40.0,
    //backgroundColor: HexColor('333739'),
  ),
  listTileTheme: const ListTileThemeData(
    iconColor: Colors.white,
  ),
  drawerTheme: DrawerThemeData(
  //  backgroundColor: HexColor('333739'),

  ),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    bodyText2: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  ),
  iconTheme: const IconThemeData(color: Colors.white),
);
ThemeData lightTheme = ThemeData(
  primarySwatch: buildMaterialColor(const Color(0xFF00AF19)),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(
        color: Colors.black
    ),
    //backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark
    ),
    backgroundColor: Colors.white,
    elevation: 0.0,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: greenColor,
  ),
  listTileTheme: const ListTileThemeData(
    iconColor: Colors.black,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: greenColor,
    unselectedItemColor: Colors.grey,
    elevation: 40.0,
    backgroundColor: Colors.white,
  ),
  drawerTheme: const DrawerThemeData(
    backgroundColor: Colors.white,
  ),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    bodyText2: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  ),
  iconTheme: const IconThemeData(color: Colors.black),
);