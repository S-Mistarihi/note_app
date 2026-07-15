import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_app/core/constants/app_color.dart';
import 'package:note_app/screens/setting/setting_screen.dart';
import 'package:note_app/utils/custom_icon_button.dart';

import '../../../core/enum/sort_type.dart';
import '../../../core/managers/theme_manager.dart';

class BuildHeader extends StatelessWidget {
  final SortType currentSort;
  final ValueChanged<SortType> onSortSelected;

  const BuildHeader({
    super.key,
    required this.currentSort,
    required this.onSortSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Note',
          style: GoogleFonts.aBeeZee(
            fontSize: 45,
            color: Theme.of(context).colorScheme.onSurface,
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(),
        PopupMenuButton<SortType>(
          tooltip: 'Sort',
          offset: const Offset(0, 3),

          position: PopupMenuPosition.under,
          elevation: 8,
          color: ThemeManager.instance.isDark
              ? AppColor.buttonBackground.withValues(alpha: 0.60)
              : AppColor.buttonBackground.withValues(alpha: 0.80),
          shadowColor: AppColor.basicBlack,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          onSelected: onSortSelected,
          itemBuilder: (context) => [
            _buildMenuItem(title: 'Newest First', value: SortType.newest),
            _buildMenuItem(title: 'Oldest First', value: SortType.oldest),
            _buildMenuItem(title: 'A → Z', value: SortType.alphabeticalAZ),
            _buildMenuItem(title: 'Z → A', value: SortType.alphabeticalZA),
          ],
          child: Container(
            decoration: BoxDecoration(
              color: AppColor.iconBackgroundColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Icon(Icons.sort, size: 30, color: AppColor.iconColor),
            ),
          ),
        ),
        SizedBox(width: 5),
        CustomIconButton().buildIconButton(
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    SettingScreen(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                      const begin = Offset(0.0, -1.0);
                      const end = Offset.zero;

                      final tween = Tween(
                        begin: begin,
                        end: end,
                      ).chain(CurveTween(curve: Curves.ease));

                      return SlideTransition(
                        position: animation.drive(tween),
                        child: child,
                      );
                    },
              ),
            );
          },
          icon: Icon(Icons.settings),
        ),
      ],
    );
  }

  PopupMenuItem<SortType> _buildMenuItem({
    required String title,
    required SortType value,
  }) {
    return PopupMenuItem<SortType>(
      value: value,
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: GoogleFonts.nunito(
                fontSize: 18,
                color: AppColor.basicWhite,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          if (currentSort == value)
            Icon(Icons.check, size: 18, color: AppColor.iconBackgroundColor),
        ],
      ),
    );
  }
}
