import 'package:easy_localization/easy_localization.dart';

extension LocaleExtension on String {
  String get locale => this.tr();
}