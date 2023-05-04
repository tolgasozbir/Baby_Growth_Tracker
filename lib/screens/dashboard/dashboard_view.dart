import 'package:auto_route/auto_route.dart';
import 'package:baby_growth_tracker/routes/app_router.dart';
import 'package:baby_growth_tracker/widgets/app_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../../widgets/app_bar_animated.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {

  final List<PageRouteInfo<dynamic>> _routes = const [
    BabiesViewFullRoute(),
    Memories(),
    Reminders(),
    Blog(),
  ];

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.tabBar(
      physics: const NeverScrollableScrollPhysics(),
      routes: _routes,
      builder: (context, child, pageController) {
        final tabsRouter = AutoTabsRouter.of(context);
        return SafeArea(
          child: Scaffold(
            appBar: const AppBarAnimated(),
            body: child,
            bottomNavigationBar: AppNavigationBar(
              onTap: (index) => tabsRouter.setActiveIndex(index),
            ),
          ),
        );
      },
    );
  }

}