import 'package:flutter/material.dart';

class AppStrings {
  static const appName = 'Baby Growth Tracker';

  //Assets Constants

  //Language Constants
  static const lang_path = 'assets/lang';

  static const _tr_locale = Locale("tr", "TR");
  static const _en_locale = Locale("en", "US");

  static const List<Locale> supportedLocales = [
    _tr_locale, 
    _en_locale
  ];
}