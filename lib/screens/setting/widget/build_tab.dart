import 'package:flutter/material.dart';
import 'package:note_app/core/constants/app_color.dart';
import 'package:note_app/core/constants/app_text_style.dart';

class BuildTab extends StatelessWidget {
  final void Function() onTap;
  final IconData icon;
  final String text;

  const BuildTab({
    super.key,
    required this.onTap,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, size: 30, color: AppColor.iconColor),
          SizedBox(width: 15),
          Text(text, style: AppTextStyle.font24WhiteNormal),
        ],
      ),
    );
  }
}
