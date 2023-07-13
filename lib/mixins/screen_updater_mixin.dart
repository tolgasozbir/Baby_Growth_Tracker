import 'package:flutter/material.dart';

mixin ScreenUpdaterMixin<T extends StatefulWidget> on State<T> {
  void updateScreen({VoidCallback? fn}) {
    if (!mounted) return;
    setState(() => fn?.call());
  }
}