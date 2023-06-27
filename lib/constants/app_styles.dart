import 'package:flutter/material.dart';
//TODO: THEME
class AppTextStyles {
  AppTextStyles._();

  static const h1 = TextStyle(fontSize: 34, fontWeight: FontWeight.bold, height: 1.5);
  static const h2 = TextStyle(fontSize: 28, fontWeight: FontWeight.w400, height: 1.5);
  static const h3 = TextStyle(fontSize: 24, fontWeight: FontWeight.w400, height: 1.5);
  static const h4 = TextStyle(fontSize: 18, fontWeight: FontWeight.w400, height: 1.5);
  static const h5 = TextStyle(fontSize: 16, fontWeight: FontWeight.w400, height: 1.5);
  static const h6 = TextStyle(fontSize: 14, fontWeight: FontWeight.w400, height: 1.5);
  static const h7 = TextStyle(fontSize: 12, fontWeight: FontWeight.w400, height: 1.5);
}

class AppPaddings {
  AppPaddings._();

  static const paddingNone = EdgeInsets.zero;
  static const paddingAll8 = EdgeInsets.all(8.0);
  static const paddingAll12 = EdgeInsets.all(12.0);

  //Specific
  static const BorderedButtonPadding = EdgeInsets.symmetric(vertical: 12, horizontal: 48);
}