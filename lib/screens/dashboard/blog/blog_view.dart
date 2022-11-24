import 'package:baby_growth_tracker/constants/locale_keys.g.dart';
import 'package:baby_growth_tracker/widgets/locale_text.dart';
import 'package:flutter/material.dart';

class BlogView extends StatelessWidget {
  const BlogView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.amber,
      child: LocaleText(text: LocaleKeys.blog),
    );
  }
}