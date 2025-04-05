import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:window_size/window_size.dart';
import 'dart:io';

import 'screens/home_screen.dart';
import 'providers/mods_provider.dart';
import 'providers/settings_provider.dart';
import 'localization/app_localizations.dart';
import 'constants/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isWindows) {
    setWindowTitle('Inzoi Mods Manager');
    setWindowMinSize(const Size(800, 600));
    setWindowMaxSize(Size.infinite);
  }

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ModsProvider()),
        ChangeNotifierProvider(create: (_) => SettingsProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settingsProvider = Provider.of<SettingsProvider>(context);

    return MaterialApp(
      title: 'Inzoi Mods Manager by MjKey',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: settingsProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      locale: settingsProvider.currentLocale,
      supportedLocales: const [
        Locale('en', ''),
        Locale('ru', ''),
        Locale('fr', ''),
      ],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: const HomeScreen(),
    );
  }
}
