import 'package:flutter/material.dart';
import 'package:note_app/core/constants/app_color.dart';
import 'package:note_app/core/constants/app_text_style.dart';
import 'package:note_app/screens/setting/setting_screen.dart';
import 'package:note_app/utils/custom_icon_button.dart';

import '../../../core/enum/sort_type.dart';

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
        Text('Note', style: AppTextStyle.font45WhiteBold),
        Spacer(),
        PopupMenuButton<SortType>(
          tooltip: 'Sort',
          offset: const Offset(0, 18),

          position: PopupMenuPosition.under,
          elevation: 8,
          color: AppColor.basicBlack.withValues(alpha: 0.60),
          shadowColor: Colors.blue,
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
          Expanded(child: Text(title, style: AppTextStyle.font18Bold)),
          if (currentSort == value)
            Icon(Icons.check, size: 18, color: AppColor.iconBackgroundColor),
        ],
      ),
    );
  }
}
