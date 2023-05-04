import 'package:auto_route/auto_route.dart';
import 'package:baby_growth_tracker/extensions/string_extension.dart';
import 'package:flutter/material.dart';

import '../constants/locale_keys.g.dart';

class AppBarAnimated extends StatelessWidget implements PreferredSizeWidget {
  const AppBarAnimated({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: _animatedText(context),
      leading: context.watchRouter.canPop() ? const AutoLeadingButton() : null,
      actions: const [
        Icon(Icons.gpp_bad_outlined, size: 32,),
      ],
    );
  }

  Widget _animatedText(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 400),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(
          opacity: animation,
          child: SlideTransition(
            position: Tween<Offset>(begin: const Offset(0.0, -0.5),end: const Offset(0.0, 0.0)).animate(animation),
            child: child,
          ),
        );
      },
      child: Text(
        _getAppBarTitle(context),
        key: ValueKey(_getAppBarTitle(context)),
      ),
    );
  }

  String _getAppBarTitle(BuildContext context) {
    String currentPath = context.router.urlState.flatten.path;
    print(currentPath);
    switch (currentPath) {
      case "babies": return LocaleKeys.tabs_babies.locale;
      case "addBaby": return LocaleKeys.tabs_addBaby.locale;
      default: return "Baby Growth Tracker";
    }
  }

}