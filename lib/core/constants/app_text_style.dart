import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';

import 'app_color.dart';

class AppTextStyle {
  AppTextStyle._();

  static TextStyle font28WhiteBold = GoogleFonts.aBeeZee(
    fontSize: 45,
    color: AppColor.basicWhite,
    fontWeight: FontWeight.bold,
  );
  static TextStyle font20WhiteBold = GoogleFonts.nunito(
    fontSize: 20,
    color: AppColor.basicWhite,
    fontWeight: FontWeight.bold,
  );
  static TextStyle font24WhiteNormal = GoogleFonts.nunito(
    fontSize: 24,
    color: AppColor.basicWhite,
    fontWeight: FontWeight.normal,
  );
  static TextStyle font18BlackNormal = GoogleFonts.nunito(
    fontSize: 18,
    color: AppColor.basicBlack,
    fontWeight: FontWeight.normal,
  );
  static TextStyle font18WhiteNormal = GoogleFonts.nunito(
    fontSize: 20,
    color: AppColor.basicWhite,
    fontWeight: FontWeight.bold,
  );
}
