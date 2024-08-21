import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTextStyle {
  static AppTextStyle instance = AppTextStyle();

  TextStyle displayLarge = GoogleFonts.nunito(
    color: black1,
    fontSize: 57,
    fontWeight: FontWeight.w800,
  );
  TextStyle displayMedium = GoogleFonts.nunito(
    color: black1,
    fontSize: 45,
    fontWeight: FontWeight.w800,
  );
  TextStyle displaySmall = GoogleFonts.nunito(
    color: black1,
    fontSize: 36,
    fontWeight: FontWeight.w800,
  );

  TextStyle headLineLarge = GoogleFonts.nunito(
    color: black1,
    fontSize: 32,
    fontWeight: FontWeight.w800,
  );
  TextStyle headLineMedium = GoogleFonts.nunito(
    color: black1,
    fontSize: 28,
    fontWeight: FontWeight.w800,
  );
  TextStyle headLineSmall = GoogleFonts.nunito(
    color: black1,
    fontSize: 24,
    fontWeight: FontWeight.w800,
  );

  TextStyle titleLarge = GoogleFonts.nunito(
    color: black1,
    fontSize: 18,
    fontWeight: FontWeight.w700,
  );
  TextStyle titleMedium = GoogleFonts.nunito(
    color: black1,
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );
  TextStyle titleSmall = GoogleFonts.nunito(
    color: black1,
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );

  TextStyle bodyLarge = GoogleFonts.nunito(
    color: black1,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
  TextStyle bodyMedium = GoogleFonts.nunito(
    color: black1,
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );
  TextStyle bodySmall = GoogleFonts.nunito(
    color: black1,
    fontSize: 12,
    fontWeight: FontWeight.w600,
  );

  TextStyle labelLarge = GoogleFonts.nunito(
    color: black1,
    fontWeight: FontWeight.w500,
    fontSize: 12,
  );
  TextStyle labelMedium = GoogleFonts.nunito(
    color: black1,
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );
  TextStyle labelSmall = GoogleFonts.nunito(
    color: black1,
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );
}
