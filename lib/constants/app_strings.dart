import 'package:flutter/material.dart';

class AppStrings {
  static const appName = 'Baby Growth Tracker';

  //Language Constants
  static const lang_path = 'assets/lang';

  static const _tr_locale = Locale("tr", "TR");
  static const _en_locale = Locale("en", "US");

  static const List<Locale> supportedLocales = [
    _tr_locale, 
    _en_locale
  ];

  //Assets Constants
  static const splashIcon = "assets/icons/ic_splash.png";
  static const defaultBabyImage = "assets/images/img_default_baby.jpg";

}