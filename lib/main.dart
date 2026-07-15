import 'package:flutter/material.dart';
import 'package:note_app/core/managers/hive_manager.dart';
import 'package:note_app/core/managers/theme_manager.dart';
import 'package:sizer/sizer.dart';
import 'package:note_app/screens/splash/splash_screen.dart';

import 'core/constants/hive_boxes.dart';
import 'core/managers/sort_manager.dart';
import 'core/theme/dark_theme.dart';
import 'core/theme/light_theme.dart';
import 'models/note_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await HiveManager.instance.init();

  HiveManager.instance.registerAdapter(NoteModelAdapter());

  await HiveManager.instance.openBox<NoteModel>(HiveBoxes.notes);

  await ThemeManager.instance.init();

  await SortManager.instance.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: ThemeManager.instance,

      builder: (context, _) {
        return Sizer(
          builder: (context, orientation, screenType) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,

              locale: const Locale('en'),

              theme: lightTheme,

              darkTheme: darkTheme,

              themeMode: ThemeManager.instance.themeMode,

              home: const SplashScreen(),
            );
          },
        );
      },
    );
  }
}