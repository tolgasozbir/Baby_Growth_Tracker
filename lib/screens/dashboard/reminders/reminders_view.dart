import 'package:flutter/material.dart';

import '../../../constants/locale_keys.g.dart';
import '../../../widgets/locale_text.dart';

class ReminderView extends StatelessWidget {
  const ReminderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.green,
      child: const LocaleText(text: LocaleKeys.tabs_reminders),
    );
  }
}