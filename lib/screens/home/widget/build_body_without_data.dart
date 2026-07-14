import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_text_style.dart';

class BuildBodyWithoutData extends StatelessWidget {
  const BuildBodyWithoutData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 14.h),
        Lottie.asset(AppAssets.createFirstNote),
        Text(
          'Create your first note !',
          style: AppTextStyle.font20WhiteBold,
        ),
      ],
    );
  }
}
