import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:baby_growth_tracker/screens/dashboard/babies/add_baby_view.dart';
import 'package:baby_growth_tracker/screens/dashboard/babies/babies_view.dart';
import 'package:baby_growth_tracker/screens/dashboard/babies/baby_detail/baby_detail_veiw.dart';
import 'package:baby_growth_tracker/screens/dashboard/blog/blog_view.dart';
import 'package:baby_growth_tracker/screens/dashboard/dashboard_view.dart';
import 'package:baby_growth_tracker/screens/dashboard/reminders/reminders_view.dart';
import 'package:baby_growth_tracker/screens/splash/splash_view.dart';
import 'package:flutter/material.dart';

import '../models/baby.dart';
import '../screens/dashboard/memories/memories_view.dart';

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
              page: AddBabyView,
              path: 'addBaby',
            ),
            CustomRoute(
              page: BabyDetailView,
              path: 'babyDetail',
              transitionsBuilder: TransitionsBuilders.fadeIn
            )
          ],
        ),
        AutoRoute(
          page: MemoriesView,
          name: "memories",
        ),
        AutoRoute(
          page: ReminderView,
          name: "reminders",
        ),
        AutoRoute(
          page: BlogView,
          name: "blog",
        ),
      ],
    ),
  ],
)
class AppRouter extends _$AppRouter{}