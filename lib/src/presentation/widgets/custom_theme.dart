import 'package:flutter/material.dart';

import 'palette.dart';

mixin CustomTheme {
  static final theme = ThemeData(
    fontFamily: 'Lato',
    primaryColor: Palette.primary,
    backgroundColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    primaryColorBrightness: Brightness.light,
    accentColor: Palette.accent,
    accentColorBrightness: Brightness.dark,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Palette.accent,
      foregroundColor: Colors.white,
    ),
    iconTheme: IconThemeData(
      color: Palette.accent,
    ),
    appBarTheme: AppBarTheme(
      brightness: Brightness.light,
      color: Colors.white,
      centerTitle: false,
      actionsIconTheme: const IconThemeData(size: 25, color: Palette.accent),
      textTheme: TextTheme(
        headline6: TextStyle(
          color: Palette.accent,
          fontSize: 25,
          fontFamily: 'Lato',
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
