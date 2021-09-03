import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:where_is_my_potty_mom/main.dart';

class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

@override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 3000), ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Anasayfa())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("images/splashIcon.png"),
          SpinKitSpinningLines(color: Colors.black),
        ],
      ),
    );
  }
}