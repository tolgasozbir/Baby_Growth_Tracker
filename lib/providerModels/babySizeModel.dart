import 'package:flutter/material.dart';

class BabySizeModel extends ChangeNotifier {
  double pointerValue = 130;
  double textWidgetPointerValue = 40;

  double readPointerVal(){
    return pointerValue;
  }

    double readTextWidgetPointerValue(){
    return textWidgetPointerValue;
  }

  void updatePointer(dynamic value) {
    pointerValue = value as double ;
    notifyListeners();
  }

  void updateTextWidgetPointerValue(dynamic value) {
    textWidgetPointerValue = value as double ;
    notifyListeners();
  }


}