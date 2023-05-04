import 'package:baby_growth_tracker/constants/app_strings.dart';
import 'package:baby_growth_tracker/screens/splash/splash_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends SplashViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(AppStrings.splashIcon),
          const SpinKitSpinningLines(color: Colors.black),
        ],
      ),
    );
  }
}