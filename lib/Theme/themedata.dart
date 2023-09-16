//  * Created by: Sourav Bapari
//  * ----------------------------------------------------------------------------
import 'package:flutter/material.dart';

ThemeData? appTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.black),
    elevation: 0,
  ),
  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(
      iconColor: MaterialStateProperty.all(Colors.black54),
      elevation: MaterialStateProperty.all(0),
    ),
  ),
  iconTheme: const IconThemeData(color: Colors.black54),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: Colors.white, // Your accent color
  ),
);
