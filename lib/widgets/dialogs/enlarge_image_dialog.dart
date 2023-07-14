import 'package:baby_growth_tracker/constants/app_styles.dart';
import 'package:baby_growth_tracker/extensions/context_extension.dart';
import 'package:baby_growth_tracker/widgets/bordered_button.dart';
import 'package:baby_growth_tracker/widgets/locale_text.dart';
import 'package:flutter/material.dart';

import '../../constants/locale_keys.g.dart';

Future<bool?> showEnlargedImage(BuildContext context, Widget imageWidget) async {
  return await showDialog<bool?>(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        child: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Column(
            children: [
              Expanded(child: imageWidget),
              Row(
                children: [
                  Expanded(
                    child: BorderedButton(
                      backgroundColor: context.colorScheme.primary,
                      foregroundColor: context.colorScheme.onSecondary,
                      borderColor: context.colorScheme.onPrimary,
                      margin: AppPaddings.paddingAll12,
                      child: const LocaleText(text: LocaleKeys.common_delete), 
                      onPressed: () => Navigator.pop(context, true),
                    ),
                  ),
                  Expanded(
                    child: BorderedButton(
                      backgroundColor: context.colorScheme.onSecondary,
                      margin: AppPaddings.paddingAll12,
                      child: const LocaleText(text: LocaleKeys.common_back), 
                      onPressed: () =>  Navigator.pop(context),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}