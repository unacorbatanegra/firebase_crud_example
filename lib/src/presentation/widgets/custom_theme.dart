import 'package:flutter/material.dart';

mixin CustomTheme {
  static const _primary = Color(0xFF2A1A5E);
  static const _accent = Color(0xFFF1A640);
  static final theme = ThemeData(
    fontFamily: 'Nunito',
    primaryColor: _primary,
    backgroundColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    primaryColorBrightness: Brightness.dark,
    accentColor: _accent,
    accentColorBrightness: Brightness.light,
    textTheme: TextTheme(
        // b
        ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: _accent,
      foregroundColor: Colors.white,
    ),
    appBarTheme: AppBarTheme(
      brightness: Brightness.dark,
      color: _primary,
      centerTitle: false,
      actionsIconTheme: const IconThemeData(size: 25, color: Colors.white),
      textTheme: TextTheme(
        headline6: TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontFamily: 'Nunito',
          fontWeight: FontWeight.normal,
        ),
      ),
    ),
  );
}
