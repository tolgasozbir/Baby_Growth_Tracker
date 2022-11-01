import 'package:baby_growth_tracker/theme/app_theme.dart';
import 'package:flutter/material.dart';

import 'routes/app_router.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Baby Growth Tracker',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appLightTheme,
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
