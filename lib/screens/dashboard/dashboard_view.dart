import 'package:auto_route/auto_route.dart';
import 'package:baby_growth_tracker/routes/app_router.dart';
import 'package:baby_growth_tracker/widgets/app_navigation_bar.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {

  final Duration pageSwipeDuration = Duration(milliseconds: 600);

  List<PageRouteInfo<dynamic>> _routes = [
    BabiesViewFullRoute(),
    Memories(),
    Reminders(),
    Blog(),
  ];

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.pageView(
      physics: NeverScrollableScrollPhysics(),
      routes: _routes,
      builder: (context, child, pageController) {
        final tabsRouter = AutoTabsRouter.of(context);
        return SafeArea(
          child: Scaffold(
            appBar: _appBar(context),
            body: child,
            bottomNavigationBar: _navBar(tabsRouter, pageController),
          ),
        );
      },
    );
  }

  AppBar _appBar(BuildContext context) {
    // String currentPath = context.router.urlState.flatten.path;
    // print(currentPath);
    return AppBar(
      title: Text("Holaaa"),
      leading: context.watchRouter.canPop() ? const AutoLeadingButton() : null,
      actions: [
        Icon(Icons.gpp_bad_outlined, size: 32,),
      ],
    );
  }

  AppNavigationBar _navBar(TabsRouter tabsRouter, PageController pageController) {
    return AppNavigationBar(
      onTap: (index) {
        tabsRouter.setActiveIndex(index);
        pageController.animateToPage(index, duration: pageSwipeDuration, curve: Curves.linear);
      },
    );
  }

}