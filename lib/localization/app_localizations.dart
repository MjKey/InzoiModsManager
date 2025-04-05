import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'translations.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
  _AppLocalizationsDelegate();

  late Map<String, String> _localizedStrings;

  Future<bool> load() async {
    if (locale.languageCode == 'ru') {
      _localizedStrings = Translations.ru;
    } else if (locale.languageCode == 'fr') {
      _localizedStrings = Translations.fr;
    } else {
      _localizedStrings = Translations.en;
    }
    return true;
  }

  String translate(String key) {
    return _localizedStrings[key] ?? key;
  }

  // Общие строки
  String get appTitle => translate('appTitle');
  String get selectGameFolder => translate('selectGameFolder');
  String get enabledMods => translate('enabledMods');
  String get disabledMods => translate('disabledMods');
  String get settings => translate('settings');
  String get addMods => translate('addMods');
  String get refresh => translate('refresh');
  String get rename => translate('rename');
  String get delete => translate('delete');
  String get enable => translate('enable');
  String get disable => translate('disable');
  String get theme => translate('theme');
  String get language => translate('language');
  String get russian => translate('russian');
  String get english => translate('english');
  String get french => translate('french');
  String get darkTheme => translate('darkTheme');
  String get lightTheme => translate('lightTheme');
  String get gamePathNotSet => translate('gamePathNotSet');
  String get noModsFound => translate('noModsFound');
  String get loading => translate('loading');
  String get error => translate('error');
  String get success => translate('success');

  // Диалоги
  String get confirmDelete => translate('confirmDelete');
  String get cancel => translate('cancel');
  String get ok => translate('ok');
  String get enterNewName => translate('enterNewName');
  String get confirmDeleteMessage => translate('confirmDeleteMessage');
  String get selectMod => translate('selectMod');
  String get modFiles => translate('modFiles');

  // Подсказки
  String get dragAndDropModsHere => translate('dragAndDropModsHere');
  String get selectModDescription => translate('selectModDescription');
  String get gamePathDescription => translate('gamePathDescription');
  String get restartRequired => translate('restartRequired');
  String get dragModHere => translate('dragModHere');
  String get modInfoTooltip => translate('modInfoTooltip');
  String get dragToEnableDisable => translate('dragToEnableDisable');

  // Порядок загрузки модов
  String get modLoadOrder => translate('modLoadOrder');
  String get modLoadOrderDescription => translate('modLoadOrderDescription');
  String get moveUp => translate('moveUp');
  String get moveDown => translate('moveDown');
  String get applyOrder => translate('applyOrder');
  String get noEnabledMods => translate('noEnabledMods');
  String get manageLoadOrder => translate('manageLoadOrder');

  // ZIP-архивы и импорт
  String get importingMods => translate('importingMods');
  String get modsAddedSuccess => translate('modsAddedSuccess');
  String get noModsInZip => translate('noModsInZip');
  String get invalidFileFormat => translate('invalidFileFormat');
  String get dropToAddMods => translate('dropToAddMods');
  String get dropModsHere => translate('dropModsHere');
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'ru', 'fr'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    final localizations = AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
