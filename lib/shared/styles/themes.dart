import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:green/shared/styles/colors.dart';
import 'package:hexcolor/hexcolor.dart';

final primarySwatch = buildMaterialColor(const Color(0xFF00AF19));
AppBarTheme appBarLightTheme = AppBarTheme(
  titleTextStyle: const TextStyle(
    color: Colors.white,
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    fontFamily: 'Lato-Regular',
  ),
  iconTheme: const IconThemeData(
      color: Colors.white
  ),
  systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor:  HexColor('333739'),
      statusBarIconBrightness: Brightness.light
  ),
   backgroundColor: HexColor('333739'),
  elevation: 0.0,
);
const AppBarTheme appBarDarkTheme = AppBarTheme(
  titleTextStyle: TextStyle(
    color: Colors.black,
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    fontFamily: 'Lato-Regular',
  ),
  iconTheme: IconThemeData(
      color: Colors.black
  ),
  systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark
  ),
  backgroundColor: Colors.white,
  elevation: 0.0,
);
final FloatingActionButtonThemeData floatingActionButtonTheme = FloatingActionButtonThemeData(
  backgroundColor: greenColor,
);
final BottomNavigationBarThemeData bottomNavigationBarLightTheme = BottomNavigationBarThemeData(
  type: BottomNavigationBarType.fixed,
  selectedItemColor: greenColor,
  unselectedItemColor: Colors.grey,
  elevation: 40.0,
  backgroundColor: HexColor('333739'),
);
final BottomNavigationBarThemeData bottomNavigationBarDarkTheme = BottomNavigationBarThemeData(
  type: BottomNavigationBarType.fixed,
  selectedItemColor: greenColor,
  unselectedItemColor: Colors.grey,
  elevation: 40.0,
  backgroundColor: Colors.white,
);
const ListTileThemeData listTileLightTheme = ListTileThemeData(
  iconColor: Colors.white,
);
const ListTileThemeData listTileDarkTheme = ListTileThemeData(
  iconColor: Colors.black,
);
final DrawerThemeData drawerLightTheme = DrawerThemeData(
   backgroundColor: HexColor('333739'),
);
const DrawerThemeData drawerDarkTheme = DrawerThemeData(
   backgroundColor: Colors.white,
);

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: HexColor('333739'),
  primarySwatch: primarySwatch,
  appBarTheme: appBarLightTheme,
  floatingActionButtonTheme: floatingActionButtonTheme,
  bottomNavigationBarTheme: bottomNavigationBarLightTheme,
  listTileTheme: listTileLightTheme,
  drawerTheme: drawerLightTheme,
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
    headline5: TextStyle(
      color: Colors.white,
    ),
  ),
  iconTheme: const IconThemeData(color: Colors.white),
    hintColor: Colors.grey,
    inputDecorationTheme: const InputDecorationTheme(
      focusColor: Colors.green,
      hintStyle: TextStyle(
        color: Colors.grey,
      ),
    )
);
ThemeData lightTheme = ThemeData(

  primarySwatch: primarySwatch,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: appBarDarkTheme,
  floatingActionButtonTheme: floatingActionButtonTheme,
  listTileTheme: listTileDarkTheme,
  bottomNavigationBarTheme: bottomNavigationBarDarkTheme,
  drawerTheme: drawerDarkTheme,
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
  fontFamily: 'Lato-Regular',
  iconTheme: const IconThemeData(color: Colors.black),
    hintColor: Colors.grey,
    inputDecorationTheme: const InputDecorationTheme(
      focusColor: Colors.green,
      hintStyle: TextStyle(
        color: Colors.grey,
      ),
    )
);