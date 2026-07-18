import 'package:flutter/material.dart';
import 'package:note_app/core/managers/hive_manager.dart';
import 'package:note_app/core/managers/theme_manager.dart';
import 'package:note_app/generated/l10n.dart';
import 'package:note_app/l10n/app_locale.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:note_app/screens/splash/splash_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/constants/hive_boxes.dart';
import 'core/managers/sort_manager.dart';
import 'core/theme/dark_theme.dart';
import 'core/theme/light_theme.dart';
import 'models/note_model.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();


  await HiveManager.instance.init();

  HiveManager.instance.registerAdapter(NoteModelAdapter());

  await HiveManager.instance.openBox<NoteModel>(HiveBoxes.notes);

  await ThemeManager.instance.init();

  await SortManager.instance.init();

  Locale deviceLocale = widgetsBinding.platformDispatcher.locale;

  String defaultLanguageCode = deviceLocale.languageCode;

  final SharedPreferences prefs = await SharedPreferences.getInstance();

  String savedLanguageCode =
      prefs.getString('currentLanguage') ?? defaultLanguageCode;

  AppLocale().changeLanguage(languageCode: savedLanguageCode);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScopedModel<AppLocale>(
      model: AppLocale(),
      child: ScopedModelDescendant<AppLocale>(
        builder: (_, w, appLocale) {
          return AnimatedBuilder(
            animation: ThemeManager.instance,

            builder: (context, _) {
              return Sizer(
                builder: (context, orientation, screenType) {
                  return MaterialApp(
                    debugShowCheckedModeBanner: false,
                    locale: AppLocale().locale,
                    localizationsDelegates: [
                      S.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                    ],
                    supportedLocales: S.delegate.supportedLocales,
                    theme: lightTheme,
                    darkTheme: darkTheme,
                    themeMode: ThemeManager.instance.themeMode,
                    home: const SplashScreen(),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
