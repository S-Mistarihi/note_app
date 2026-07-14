import 'package:flutter/material.dart';
import 'package:note_app/core/constants/app_color.dart';
import 'package:note_app/core/constants/app_text_style.dart';

class EditNoteSetting extends StatelessWidget {
  final bool isPinned;
  final bool isLightMode;

  final VoidCallback onPinPressed;
  final ValueChanged<bool> onThemeChanged;

  const EditNoteSetting({
    super.key,
    required this.isPinned,
    required this.isLightMode,
    required this.onPinPressed,
    required this.onThemeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
                onPinPressed();
              },
              child: Row(
                children: [
                  Icon(
                    isPinned ? Icons.push_pin : Icons.push_pin_outlined,
                    color: AppColor.iconColor,
                  ),
                  SizedBox(width: 16),
                  Text(
                    isPinned ? 'Unpin Note' : 'Pin Note',
                    style: AppTextStyle.font18Bold,
                  ),
                ],
              ),
            ),

            Divider(color: AppColor.buttonBackground, thickness: 1),

            Row(
              children: [
                Icon(Icons.light_mode, color: AppColor.iconColor),
                SizedBox(width: 16),
                Expanded(
                  child: Text('Light Mode', style: AppTextStyle.font18Bold),
                ),

                Switch(value: isLightMode, onChanged: onThemeChanged),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
