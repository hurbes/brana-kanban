import 'package:brana/ui/themes/brana_app_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:timezone/data/latest.dart' as tz;

import 'app/app.bottomsheets.dart';
import 'app/app.dialogs.dart';
import 'app/app.locator.dart';
import 'app/app.router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones();

  await ThemeManager.initialise();
  await EasyLocalization.ensureInitialized();

  await setupLocator(stackedRouter: stackedRouter);
  setupDialogUi();
  setupBottomSheetUi();
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('de', 'DE'),
        Locale('bn', 'BD'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('en', 'US'),
      child: const BranaApp(),
    ),
  );
}

class BranaApp extends StatelessWidget {
  const BranaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
      defaultThemeMode: ThemeMode.dark,
      darkTheme: BRANA_APP_DARK_THEME,
      lightTheme: BRANA_APP_LIGHT_THEME,
      builder: (context, regularTheme, darkTheme, themeMode) {
        return MaterialApp.router(
          title: 'Brana',
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          darkTheme: darkTheme,
          theme: regularTheme,
          themeMode: themeMode,
          routerDelegate: stackedRouter.delegate(),
          routeInformationParser: stackedRouter.defaultRouteParser(),
        );
      },
    );
  }
}
