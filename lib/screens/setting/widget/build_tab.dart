import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_app/core/constants/app_color.dart';

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
          Text(text, style: GoogleFonts.nunito(
            fontSize: 24,
            color: Theme.of(context).colorScheme.onSurface,
            fontWeight: FontWeight.normal,
          )),
        ],
      ),
    );
  }
}
