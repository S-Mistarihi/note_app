import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constants/app_assets.dart';

class BuildBodyWithoutData extends StatelessWidget {
  final bool isSearchEmpty;

  const BuildBodyWithoutData({super.key, this.isSearchEmpty = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16.h),
        if (isSearchEmpty)
          Image.asset(AppAssets.noNoteFound)
        else
          Lottie.asset(AppAssets.createFirstNote),
        SizedBox(height: 16,),
        Text(
          isSearchEmpty ? 'No Notes Found' : 'No Notes Yet',
          style: GoogleFonts.nunito(
            fontSize: 20,
            color: Theme.of(context).colorScheme.onSurface,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 4,),
        Text(
          isSearchEmpty
              ? 'Try searching with another word'
              : 'Create your first note',
          style: GoogleFonts.nunito(
            fontSize: 20,
            color: Theme.of(context).colorScheme.onSurface,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
