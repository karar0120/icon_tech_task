import 'package:flutter/material.dart';
import 'package:icon_tech_task/core/theming/color.dart';

ThemeData themeData = ThemeData(
    appBarTheme: const AppBarTheme(backgroundColor: ColorsManager.dark),
    primaryColor: ColorsManager.mainBlue,
    scaffoldBackgroundColor: Colors.white,
    cardColor: ColorsManager.dark,
    indicatorColor: ColorsManager.gray);
