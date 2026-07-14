import 'package:flutter/material.dart';
import 'package:note_app/utils/custom_icon_button.dart';

class BuildHeader extends StatelessWidget {
  final void Function() onPressedSavedUpdate;

  const BuildHeader({super.key, required this.onPressedSavedUpdate});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomIconButton().buildIconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
        Spacer(),
        CustomIconButton().buildIconButton(
          onPressed: () {},
          icon: Icon(Icons.more_horiz),
        ),
        SizedBox(width: 5),
        CustomIconButton().buildIconButton(
          onPressed: onPressedSavedUpdate,
          icon: Icon(Icons.check),
        ),
      ],
    );
  }
}
