import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/app_color.dart';
import '../../../generated/l10n.dart';

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
          child: Text(
            S.of(context).lightModeLabel,
            style: GoogleFonts.nunito(
              fontSize: 24,
              color: Theme.of(context).colorScheme.onSurface,
              fontWeight: FontWeight.normal,
            ),
          ),
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
