import 'package:flutter/material.dart';
import 'package:note_app/utils/custom_icon_button.dart';


class BuildHeader extends StatelessWidget {
  final VoidCallback onPressedBack;
  final VoidCallback onPressedMenu;
  final VoidCallback onPressedSave;

  const BuildHeader({
    super.key, required this.onPressedBack, required this.onPressedMenu, required this.onPressedSave,

  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomIconButton().buildIconButton(
          onPressed: onPressedBack,
          icon: Icon(Icons.close),
        ),
        Spacer(),
        CustomIconButton().buildIconButton(
          onPressed: onPressedMenu,
          icon: Icon(Icons.more_horiz),
        ),
        SizedBox(width: 5),
        CustomIconButton().buildIconButton(
          onPressed: onPressedSave,
          icon: Icon(Icons.check),
        ),
      ],
    );
  }
}
