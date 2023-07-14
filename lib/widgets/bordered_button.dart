import 'package:baby_growth_tracker/constants/app_styles.dart';
import 'package:baby_growth_tracker/extensions/context_extension.dart';
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
    this.foregroundColor,
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
  final Color? foregroundColor;
  final Widget child;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? AppPaddings.paddingAll8,
      child: SizedBox(
        width: btnWidth,
        height: btnHeight,
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            foregroundColor: foregroundColor,
            backgroundColor: backgroundColor,
            shape: const StadiumBorder(),
            side: BorderSide(
              color: borderColor ?? context.colorScheme.primary,
              width: borderWidth ?? 1.6,
            ),
          ),
          onPressed: onPressed,
          child: Padding(
            padding: margin ?? AppPaddings.BorderedButtonPadding,
            child: child,
          )
        ),
      ),
    );
  }
}