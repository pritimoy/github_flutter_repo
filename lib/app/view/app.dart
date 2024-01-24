import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:github_flutter_repo/features/home/presentation/screen/screen_home.dart';

import '../../core/core_export.dart';
import '../../res/res_export.dart';
import '../../services/navigation/navigation_service.dart';

class AppRepositoryProvider extends StatelessWidget {
  const AppRepositoryProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AppBlocProvider();
  }
}

class AppBlocProvider extends StatefulWidget {
  const AppBlocProvider({Key? key}) : super(key: key);

  @override
  State<AppBlocProvider> createState() => _AppBlocProviderState();
}

class _AppBlocProviderState extends State<AppBlocProvider> {
  Locale? _locale;

  @override
  Widget build(BuildContext context) {
    _locale = const Locale("en");

    return MaterialApp(
        navigatorKey: NavigationService.navigatorKey,
        onGenerateRoute: AppRouter.generateRoute,
        locale: _locale,
        supportedLocales: const [
          Locale("en"),
          Locale("bn"),
        ],
        localizationsDelegates: const [
          AppLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          DefaultMaterialLocalizations.delegate,
          DefaultWidgetsLocalizations.delegate
        ],
        localeResolutionCallback: (locale, supportedLocales) {
          for (var supportedLocal in supportedLocales) {
            if (supportedLocal.languageCode == locale?.languageCode &&
                supportedLocal.countryCode == locale?.countryCode) {
              return supportedLocal;
            }
          }
          return supportedLocales.first;
        },
        title: context.resources.strings?.appName ?? "GitHub Flutter Repo",
        theme: ThemeData(
          appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
        ),
        home: const HomeScreen());
  }
}
