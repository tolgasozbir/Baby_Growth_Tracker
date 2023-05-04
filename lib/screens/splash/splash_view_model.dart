import 'package:auto_route/auto_route.dart';
import 'package:baby_growth_tracker/providers/babies_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../routes/app_router.dart';
import 'splash_view.dart';

abstract class SplashViewModel extends State<SplashView> {
  final Duration _splashDuration = const Duration(milliseconds: 3000);

  @override
  void initState() {
    init();
    super.initState();
  }

  void init() async {
    await Future.microtask(() => context.read<BabiesProvider>().initCacheValues());
    await goToDashboard();
  }

  Future<void> goToDashboard() async {
    await Future.delayed(_splashDuration, () => context.router.replace(const DashboardRoute()));
  }

}