import 'package:core/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

enum AppLocale {
  en(flag: '🇬🇧', title: LocaleKeys.enLanguage, languageCode: 'en'),
  ru(flag: '🇷🇺', title: LocaleKeys.ruLanguage, languageCode: 'ru'),
  uz(flag: '🇺🇿', title: LocaleKeys.uzLanguage, languageCode: 'uz');

  final String flag;
  final String title;
  final String languageCode;

  const AppLocale({
    required this.flag,
    required this.title,
    required this.languageCode,
  });
}

mixin AppLocaleConfig {
  static const String fallbackLocale = 'ru';
  static const String localePath = 'packages/core/translations';

  static AppLocale currentLocale(Locale locale) {
    final lang = locale.languageCode;
    final result = AppLocale.values.firstWhere(
      (element) => element.languageCode == lang,
    );
    return result;
  }
}
