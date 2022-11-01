import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:baby_growth_tracker/screens/dashboard/babies/add_baby_view.dart';
import 'package:baby_growth_tracker/screens/dashboard/babies/babies_view.dart';
import 'package:baby_growth_tracker/screens/dashboard/dashboard_view.dart';
import 'package:baby_growth_tracker/screens/splash/splash_view.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(              
  replaceInRouteName: 'View,Route',
  routes: [
    AutoRoute(
      initial: true,
      page: SplashView,
      path: '/splash'
    ),
    AutoRoute(
      page: DashboardView,
      path: '/dashboard',
      children: [
        AutoRoute(
          page: EmptyRouterPage,
          name: 'babiesViewFullRoute',
          children: [
            AutoRoute(
              initial: true,
              page: BabiesView,
              path: 'babies',
            ),
            AutoRoute(
              initial: true,
              page: AddBabyView,
              path: 'addBaby',
            ),
          ],
        ),
      ],
    ),
  ],
)
class AppRouter extends _$AppRouter{}