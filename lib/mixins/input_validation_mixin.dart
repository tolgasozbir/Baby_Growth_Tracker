import 'package:baby_growth_tracker/constants/locale_keys.g.dart';
import 'package:baby_growth_tracker/extensions/string_extension.dart';

mixin InputValidationMixin {
  String? isValid(String? value) {
    return value?.trim().isNotEmpty ?? false 
      ? null
      : LocaleKeys.errorMsg_empty.locale;
  }
}