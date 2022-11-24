import 'package:auto_route/auto_route.dart';
import 'package:baby_growth_tracker/extensions/context_extension.dart';
import 'package:baby_growth_tracker/extensions/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';

import '../constants/locale_keys.g.dart';

class AppNavigationBar extends StatefulWidget {
  const AppNavigationBar({super.key, this.onTap});

  final ValueChanged<int>? onTap;

  @override
  State<AppNavigationBar> createState() => _AppNavigationBarState();
}

class _AppNavigationBarState extends State<AppNavigationBar> {

  final List<BottomNavigationBarItem> _navBarItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined),
      label: LocaleKeys.babies.locale
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.favorite_outline),
      label: LocaleKeys.memories.locale,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.notifications_active_outlined),
      label: LocaleKeys.reminders.locale,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.my_library_books_outlined),
      label: LocaleKeys.blog.locale,
    ),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SnakeNavigationBar.color(
      backgroundColor: context.colorScheme.primary,
      unselectedItemColor: context.colorScheme.background,
      selectedItemColor: context.colorScheme.onPrimary,
      snakeViewColor: context.colorScheme.onPrimary,
      snakeShape: SnakeShape.indicator,
      showSelectedLabels: true,
      currentIndex: _currentIndex,
      items: _navBarItems,
      onTap: (index) {
        _currentIndex = index;
        widget.onTap?.call(index);
        context.router.popTop();
      },
    );
  }

}