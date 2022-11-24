
import 'package:flutter/material.dart';

import '../../../constants/locale_keys.g.dart';
import '../../../widgets/locale_text.dart';

class MemoriesView extends StatelessWidget {
  const MemoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.red,
      child: LocaleText(text: LocaleKeys.memories),
    );
  }
}