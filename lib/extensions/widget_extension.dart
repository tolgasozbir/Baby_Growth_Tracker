import 'package:flutter/cupertino.dart';

extension WidgetExtension on Widget{
  Widget wrapPadding(EdgeInsets edgeInsets) => Padding(padding: edgeInsets, child: this,);
}