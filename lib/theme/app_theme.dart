import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get appLightTheme => _appLightTheme();

  static ThemeData _appLightTheme() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF3D3082),
        brightness: Brightness.light,
        primary: const Color(0xFF3D3082),
        onPrimary: Colors.amber,
        secondary: const Color(0xFF3D3082),
        onSecondary: Colors.white,
        background: const Color(0xFFE6E6E6),
      ),
      iconTheme: const IconThemeData(color: Colors.white),
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
    );
  }

}