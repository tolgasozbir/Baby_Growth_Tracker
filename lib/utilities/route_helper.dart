import 'package:flutter/material.dart';

class RouteHelper {
  RouteHelper._();
  
  static void goRoute(BuildContext context, Widget page, {bool removeUntil = false}) {
    removeUntil
      ? Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> page), (route) => false)
      : Navigator.push(context, MaterialPageRoute(builder: (context)=> page));
  }
}