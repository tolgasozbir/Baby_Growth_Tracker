
import 'package:baby_growth_tracker/extensions/string_extension.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class LocaleText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final bool? softWrap;
  final bool withOutLocale;
  final List<String>? args;

  const LocaleText({
    Key? key, 
    required this.text, 
    this.style, 
    this.textAlign, 
    this.overflow, 
    this.maxLines, 
    this.softWrap,
    this.withOutLocale = false,
    this.args,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Text(
      withOutLocale 
        ? text 
        : args == null 
          ? text.locale
          : text.localeWithArgs(args: args),
      style: style,
      textScaleFactor: _ScaleSize.textScaleFactor(context),
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
    );
  }
}

class _ScaleSize {
  _ScaleSize._();

  static double textScaleFactor(BuildContext context, {double maxTextScaleFactor = 2}) {
    final width = MediaQuery.of(context).size.width;
    double val = (width / 820.0) * maxTextScaleFactor;
    return min(val, maxTextScaleFactor);
  }
}