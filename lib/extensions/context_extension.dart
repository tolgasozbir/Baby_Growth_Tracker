import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
   ColorScheme get colorScheme => Theme.of(this).colorScheme;
  
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  double get height => mediaQuery.size.height;
  double get width => mediaQuery.size.width;

  double dynamicWidth(double val) => width * val;
  double dynamicHeight(double val) => height * val;
}