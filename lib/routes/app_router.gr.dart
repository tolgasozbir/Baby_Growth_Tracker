// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const SplashView(),
      );
    },
    DashboardRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const DashboardView(),
      );
    },
    BabiesViewFullRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const EmptyRouterPage(),
      );
    },
    Memories.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const MemoriesView(),
      );
    },
    Reminders.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const ReminderView(),
      );
    },
    Blog.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const BlogView(),
      );
    },
    BabiesRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const BabiesView(),
      );
    },
    AddBabyRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const AddBabyView(),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/splash',
          fullMatch: true,
        ),
        RouteConfig(
          SplashRoute.name,
          path: '/splash',
        ),
        RouteConfig(
          DashboardRoute.name,
          path: '/dashboard',
          children: [
            RouteConfig(
              BabiesViewFullRoute.name,
              path: 'empty-router-page',
              parent: DashboardRoute.name,
              children: [
                RouteConfig(
                  '#redirect',
                  path: '',
                  parent: BabiesViewFullRoute.name,
                  redirectTo: 'babies',
                  fullMatch: true,
                ),
                RouteConfig(
                  BabiesRoute.name,
                  path: 'babies',
                  parent: BabiesViewFullRoute.name,
                ),
                RouteConfig(
                  AddBabyRoute.name,
                  path: 'addBaby',
                  parent: BabiesViewFullRoute.name,
                ),
              ],
            ),
            RouteConfig(
              Memories.name,
              path: '',
              parent: DashboardRoute.name,
            ),
            RouteConfig(
              Reminders.name,
              path: '',
              parent: DashboardRoute.name,
            ),
            RouteConfig(
              Blog.name,
              path: '',
              parent: DashboardRoute.name,
            ),
          ],
        ),
      ];
}

/// generated route for
/// [SplashView]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/splash',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [DashboardView]
class DashboardRoute extends PageRouteInfo<void> {
  const DashboardRoute({List<PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          path: '/dashboard',
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';
}

/// generated route for
/// [EmptyRouterPage]
class BabiesViewFullRoute extends PageRouteInfo<void> {
  const BabiesViewFullRoute({List<PageRouteInfo>? children})
      : super(
          BabiesViewFullRoute.name,
          path: 'empty-router-page',
          initialChildren: children,
        );

  static const String name = 'BabiesViewFullRoute';
}

/// generated route for
/// [MemoriesView]
class Memories extends PageRouteInfo<void> {
  const Memories()
      : super(
          Memories.name,
          path: '',
        );

  static const String name = 'Memories';
}

/// generated route for
/// [ReminderView]
class Reminders extends PageRouteInfo<void> {
  const Reminders()
      : super(
          Reminders.name,
          path: '',
        );

  static const String name = 'Reminders';
}

/// generated route for
/// [BlogView]
class Blog extends PageRouteInfo<void> {
  const Blog()
      : super(
          Blog.name,
          path: '',
        );

  static const String name = 'Blog';
}

/// generated route for
/// [BabiesView]
class BabiesRoute extends PageRouteInfo<void> {
  const BabiesRoute()
      : super(
          BabiesRoute.name,
          path: 'babies',
        );

  static const String name = 'BabiesRoute';
}

/// generated route for
/// [AddBabyView]
class AddBabyRoute extends PageRouteInfo<void> {
  const AddBabyRoute()
      : super(
          AddBabyRoute.name,
          path: 'addBaby',
        );

  static const String name = 'AddBabyRoute';
}
