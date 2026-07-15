import 'package:flutter/material.dart';
import 'package:note_app/core/constants/app_color.dart';

import 'app_colors_extension.dart';

final ThemeData darkTheme = ThemeData(
  useMaterial3: true,

  brightness: Brightness.dark,

  extensions:  [
    AppColorsExtension(
      primaryTextColor: AppColor.basicWhite,

      secondaryTextColor: AppColor.basicBlack,

      borderColor: Color(0xff444444),

      menuBackgroundColor: Color(0xff262626),

      iconBackgroundColor: Color(0xff2F2F2F),
    ),
  ],
);
