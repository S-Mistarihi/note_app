import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_text_style.dart';

class BuildBodyWithoutData extends StatelessWidget {
  final bool isSearchEmpty;

  const BuildBodyWithoutData({super.key, this.isSearchEmpty = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 14.h),
        if (isSearchEmpty)
          Image.asset(AppAssets.noNoteFound)
        else
          Lottie.asset(AppAssets.createFirstNote),
        Text(
          isSearchEmpty ? 'No Notes Found' : 'No Notes Yet',
          style: AppTextStyle.font20WhiteBold,
        ),
        Text(
          isSearchEmpty
              ? 'Try searching with another word'
              : 'Create your first note',
          style: AppTextStyle.font20WhiteBold,
        ),
      ],
    );
  }
}
