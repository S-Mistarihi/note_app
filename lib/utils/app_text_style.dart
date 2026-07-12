import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';
import 'package:flutter/material.dart';

class AppTextStyle {
  static TextStyle font28WhiteBold = GoogleFonts.aBeeZee(
    fontSize: 45,
    color: AppColors.basicWhite,
    fontWeight: FontWeight.bold,
  );
  static TextStyle font20WhiteBold = GoogleFonts.nunito(
    fontSize: 20,
    color: AppColors.basicWhite,
    fontWeight: FontWeight.bold,
  );
  static TextStyle font24WhiteNormal = GoogleFonts.nunito(
    fontSize: 24,
    color: AppColors.basicWhite,
    fontWeight: FontWeight.normal,
  );
}
