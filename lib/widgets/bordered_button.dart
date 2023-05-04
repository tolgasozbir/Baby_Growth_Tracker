import 'package:baby_growth_tracker/extensions/context_extension.dart';
import 'package:baby_growth_tracker/extensions/widget_extension.dart';
import 'package:flutter/material.dart';

class BorderedButton extends StatelessWidget {
  const BorderedButton({
    super.key, 
    this.btnWidth, 
    this.btnHeight,
    this.backgroundColor, 
    this.borderColor, 
    this.borderWidth, 
    this.margin, 
    this.padding, 
    this.splashColor,
    required this.child, 
    required this.onPressed
  });

  final double? btnWidth;
  final double? btnHeight;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? borderWidth;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final Color? splashColor;
  final Widget child;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: btnWidth,
      height: btnHeight,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          foregroundColor: splashColor,
          backgroundColor: backgroundColor,
          shape: const StadiumBorder(),
          side: BorderSide(
            color: borderColor ?? context.colorScheme.primary,
            width: borderWidth ?? 1.6,
          ),
        ),
        onPressed: onPressed,
        child: child.wrapPadding(margin ?? const EdgeInsets.symmetric(vertical: 12, horizontal: 48)),
      ),
    ).wrapPadding(padding ?? const EdgeInsets.all(8.0));
  }
}