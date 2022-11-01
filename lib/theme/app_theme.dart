import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get appLightTheme => _appLightTheme();

  static ThemeData _appLightTheme() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Color(0xFF3D3082),
        brightness: Brightness.light,
        primary: Color(0xFF3D3082),
        onPrimary: Colors.amber,
        secondary: Color(0xFF3D3082),
        onSecondary: Colors.white,
      ),
      iconTheme: IconThemeData(color: Colors.white),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
    );
  }

}