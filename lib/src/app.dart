import 'package:flutter/material.dart';

import 'config/router/app_routes.dart';
import 'core/extension/extension.dart';
import 'core/l10n/app_localizations.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        /// title
        debugShowCheckedModeBanner: false,
        scaffoldMessengerKey: scaffoldMessengerKey,

        /// theme style
        theme: lightTheme,
        // darkTheme: darkTheme,
        // themeMode: context.options.themeMode,

        /// lang
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,

        /// pages
        routerDelegate: router.routerDelegate,
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
      );
}
