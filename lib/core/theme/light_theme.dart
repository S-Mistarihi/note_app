import 'package:flutter/material.dart';

import '../constants/app_color.dart';
import 'app_colors_extension.dart';

final ThemeData lightTheme = ThemeData(
  useMaterial3: true,

  brightness: Brightness.light,

  extensions: const [
    AppColorsExtension(
      primaryTextColor: AppColor.basicWhite,

      secondaryTextColor: AppColor.basicBlack,

      borderColor: Color(0xffD8D8D8),

      menuBackgroundColor: Colors.white,

      iconBackgroundColor: Color(0xffF5F5F5),
    ),
  ],
);
