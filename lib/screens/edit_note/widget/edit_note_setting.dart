import 'package:flutter/material.dart';
import 'package:note_app/core/constants/app_color.dart';
import 'package:note_app/core/constants/app_text_style.dart';

import '../../../generated/l10n.dart';

class EditNoteSetting extends StatelessWidget {
  final bool isPinned;

  final VoidCallback onPinPressed;

  const EditNoteSetting({
    super.key,
    required this.isPinned,
    required this.onPinPressed,
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
                    isPinned
                        ? S.of(context).unpinNoteLabel
                        : S.of(context).pinNoteLabel,
                    style: AppTextStyle.font18Bold,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
