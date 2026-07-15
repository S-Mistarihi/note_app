import 'package:flutter/material.dart';

import '../../../core/constants/app_color.dart';
import '../../../core/constants/app_text_style.dart';

class ThemeSetting extends StatelessWidget {
  final bool isLightMode;
  final ValueChanged<bool> onThemeChanged;

  const ThemeSetting({
    super.key,
    required this.isLightMode,
    required this.onThemeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.light_mode, color: AppColor.iconColor),
        SizedBox(width: 16),
        Expanded(
          child: Text('Light Mode', style: AppTextStyle.font24WhiteNormal),
        ),

        Switch(
          value: isLightMode,
          onChanged: onThemeChanged,
          activeThumbColor: AppColor.iconColor,
          activeTrackColor: AppColor.iconBackgroundColor,
        ),
      ],
    );
  }
}
