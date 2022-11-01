import 'package:auto_route/auto_route.dart';
import 'package:baby_growth_tracker/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  final Duration _splashDuration = Duration(milliseconds: 3000);

  @override
  void initState() {
    init();
    super.initState();
  }

  void init() async {
    await goToDashboard();
  }

  Future<void> goToDashboard() async => await Future.delayed(_splashDuration, () => context.router.replace(DashboardRoute()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/icons/ic_splash.png"),
          SpinKitSpinningLines(color: Colors.black),
        ],
      ),
    );
  }
}