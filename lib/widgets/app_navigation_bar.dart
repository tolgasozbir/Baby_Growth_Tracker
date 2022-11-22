import 'package:auto_route/auto_route.dart';
import 'package:baby_growth_tracker/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';

class AppNavigationBar extends StatefulWidget {
  const AppNavigationBar({super.key, this.onTap});

  final ValueChanged<int>? onTap;

  @override
  State<AppNavigationBar> createState() => _AppNavigationBarState();
}

class _AppNavigationBarState extends State<AppNavigationBar> {

  final List<Map<String,dynamic>> _navBarItemValues = const [
    {
      "icon":Icon(Icons.home_outlined),
      "label":"Babies"
    },
    {
      "icon":Icon(Icons.favorite_outline),
      "label":"Memories"
    },
    {
      "icon":Icon(Icons.notifications_active_outlined),
      "label":"Reminders"
    },
    {
      "icon":Icon(Icons.my_library_books_outlined),
      "label":"Blog"
    },
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
      items: _navBarItemValues.map((item) => BottomNavigationBarItem(
        icon: item["icon"], 
        label: item["label"]
      )).toList(),
      onTap: (index) {
        _currentIndex = index;
        widget.onTap?.call(index);
        context.router.popTop();
      },
    );
  }

}