import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/settings_provider.dart';
import '../localization/app_localizations.dart';
import '../constants/app_theme.dart';

class SettingsDialog extends StatelessWidget {
  const SettingsDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final settingsProvider = Provider.of<SettingsProvider>(context);

    return AlertDialog(
      title: Text(localizations.settings),
      content: SizedBox(
        width: 400,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Выбор темы
            _buildSection(
              context,
              title: localizations.theme,
              tooltip: '${localizations.lightTheme} / ${localizations.darkTheme}',
              child: _buildThemeSelector(context, settingsProvider),
            ),
            const SizedBox(height: 16),
            // Выбор языка
            _buildSection(
              context,
              title: localizations.language,
              tooltip: '${localizations.english} / ${localizations.russian}',
              child: _buildLanguageSelector(context, settingsProvider),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(localizations.ok),
        ),
      ],
    );
  }

  // Построить раздел настроек
  Widget _buildSection(BuildContext context, {
    required String title,
    required Widget child,
    String? tooltip,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Tooltip(
          message: tooltip ?? title,
          child: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        const SizedBox(height: 8),
        child,
        const Divider(),
      ],
    );
  }

  // Построить селектор темы
  Widget _buildThemeSelector(BuildContext context, SettingsProvider settingsProvider) {
    final localizations = AppLocalizations.of(context);

    return Row(
      children: [
        Expanded(
          child: Tooltip(
            message: localizations.lightTheme,
            child: RadioListTile<bool>(
              title: Text(localizations.lightTheme),
              value: false,
              groupValue: settingsProvider.isDarkMode,
              onChanged: (_) => settingsProvider.toggleTheme(),
              activeColor: AppTheme.primaryLight,
              dense: true,
            ),
          ),
        ),
        Expanded(
          child: Tooltip(
            message: localizations.darkTheme,
            child: RadioListTile<bool>(
              title: Text(localizations.darkTheme),
              value: true,
              groupValue: settingsProvider.isDarkMode,
              onChanged: (_) => settingsProvider.toggleTheme(),
              activeColor: AppTheme.primaryLight,
              dense: true,
            ),
          ),
        ),
      ],
    );
  }

  // Построить селектор языка
  Widget _buildLanguageSelector(BuildContext context, SettingsProvider settingsProvider) {
    final localizations = AppLocalizations.of(context);

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Tooltip(
                message: localizations.english,
                child: RadioListTile<String>(
                  title: Text(localizations.english),
                  value: 'en',
                  groupValue: settingsProvider.currentLocale.languageCode,
                  onChanged: (value) {
                    if (value != null) {
                      settingsProvider.setLocale(Locale(value, ''));
                      _showRestartDialog(context);
                    }
                  },
                  activeColor: AppTheme.primaryLight,
                  dense: true,
                ),
              ),
            ),
            Expanded(
              child: Tooltip(
                message: localizations.russian,
                child: RadioListTile<String>(
                  title: Text(localizations.russian),
                  value: 'ru',
                  groupValue: settingsProvider.currentLocale.languageCode,
                  onChanged: (value) {
                    if (value != null) {
                      settingsProvider.setLocale(Locale(value, ''));
                      _showRestartDialog(context);
                    }
                  },
                  activeColor: AppTheme.primaryLight,
                  dense: true,
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Tooltip(
                message: localizations.french,
                child: RadioListTile<String>(
                  title: Text(localizations.french),
                  value: 'fr',
                  groupValue: settingsProvider.currentLocale.languageCode,
                  onChanged: (value) {
                    if (value != null) {
                      settingsProvider.setLocale(Locale(value, ''));
                      _showRestartDialog(context);
                    }
                  },
                  activeColor: AppTheme.primaryLight,
                  dense: true,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Показать диалог с информацией о необходимости перезапуска
  void _showRestartDialog(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(localizations.language),
        content: Text(localizations.restartRequired),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(localizations.ok),
          ),
        ],
      ),
    );
  }
}
