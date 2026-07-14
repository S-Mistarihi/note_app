import 'package:flutter/material.dart';
import 'package:note_app/core/constants/app_text_style.dart';
import 'package:note_app/utils/custom_icon_button.dart';

class BuildHeader extends StatelessWidget {
  const BuildHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Note', style: AppTextStyle.font28WhiteBold),
        Spacer(),
        CustomIconButton().buildIconButton(
          onPressed: () {},
          icon: Icon(Icons.search),
        ),
        SizedBox(width: 5),
        CustomIconButton().buildIconButton(
          onPressed: () {},
          icon: Icon(Icons.more_horiz),
        ),
      ],
    );
  }
}
