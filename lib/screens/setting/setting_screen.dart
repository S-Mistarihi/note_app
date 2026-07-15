import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:note_app/core/constants/app_assets.dart';
import 'package:note_app/core/constants/app_color.dart';
import 'package:note_app/screens/setting/widget/build_tab.dart';
import 'package:note_app/screens/setting/widget/theme_setting.dart';
import 'package:note_app/utils/custom_icon_button.dart';
import 'package:sizer/sizer.dart';

import '../../core/managers/theme_manager.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            SizedBox(height: 6.h),
            Row(
              children: [
                CustomIconButton().buildIconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.arrow_back_ios_new),
                ),
                SizedBox(width: 15),
                Text('Setting', style: GoogleFonts.nunito(
                  fontSize: 35,
                  color: Theme.of(context).colorScheme.onSurface,
                  fontWeight: FontWeight.bold,
                )),
              ],
            ),
            SizedBox(height: 8.h),
            Lottie.asset(AppAssets.settingIcon, width: 350),
            SizedBox(height: 3.h),
            _showThemeSetting(),
            SizedBox(height: 10),
            Divider(thickness: 2, color: AppColor.buttonBackground),
            SizedBox(height: 10),
            BuildTab(onTap: () {}, icon: Icons.language, text: 'Language'),
          ],
        ),
      ),
    );
  }

  ThemeSetting _showThemeSetting() {
    return ThemeSetting(
      isLightMode: !ThemeManager.instance.isDark,
      onThemeChanged: (value) async {
        await ThemeManager.instance.setTheme(!value);
      },
    );
  }
}
