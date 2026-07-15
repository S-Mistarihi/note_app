import 'package:flutter/material.dart';
import 'package:note_app/core/constants/app_text_style.dart';
import 'package:note_app/utils/custom_icon_button.dart';
import 'package:sizer/sizer.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

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
                Text('Setting', style: AppTextStyle.font35Bold),
              ],
            ),
            SizedBox(height: 5.h),
          ],
        ),
      ),
    );
  }
}
