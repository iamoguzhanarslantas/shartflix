import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static const String _fontFamily = 'Instrument Sans';

  // Font Weights
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight regular = FontWeight.w400;

  // Headings
  static TextStyle h1 = GoogleFonts.getFont(
    _fontFamily,
    fontSize: 48,
    fontWeight: bold,
  );
  static TextStyle h2 = GoogleFonts.getFont(
    _fontFamily,
    fontSize: 40,
    fontWeight: bold,
  );
  static TextStyle h3 = GoogleFonts.getFont(
    _fontFamily,
    fontSize: 32,
    fontWeight: bold,
  );
  static TextStyle h4 = GoogleFonts.getFont(
    _fontFamily,
    fontSize: 24,
    fontWeight: bold,
  );
  static TextStyle h5 = GoogleFonts.getFont(
    _fontFamily,
    fontSize: 20,
    fontWeight: bold,
  );
  static TextStyle h6 = GoogleFonts.getFont(
    _fontFamily,
    fontSize: 18,
    fontWeight: bold,
  );

  // Body Bold
  static TextStyle bodyXLargeBold = GoogleFonts.getFont(
    _fontFamily,
    fontSize: 18,
    fontWeight: bold,
  );
  static TextStyle bodyLargeBold = GoogleFonts.getFont(
    _fontFamily,
    fontSize: 16,
    fontWeight: bold,
  );
  static TextStyle bodyNormalBold = GoogleFonts.getFont(
    _fontFamily,
    fontSize: 14,
    fontWeight: bold,
  );
  static TextStyle bodySmallBold = GoogleFonts.getFont(
    _fontFamily,
    fontSize: 12,
    fontWeight: bold,
  );
  static TextStyle bodyXSmallBold = GoogleFonts.getFont(
    _fontFamily,
    fontSize: 10,
    fontWeight: bold,
  );

  // Body SemiBold
  static TextStyle bodyXLargeSemiBold = GoogleFonts.getFont(
    _fontFamily,
    fontSize: 18,
    fontWeight: semiBold,
  );
  static TextStyle bodyLargeSemiBold = GoogleFonts.getFont(
    _fontFamily,
    fontSize: 16,
    fontWeight: semiBold,
  );
  static TextStyle bodyNormalSemiBold = GoogleFonts.getFont(
    _fontFamily,
    fontSize: 14,
    fontWeight: semiBold,
  );
  static TextStyle bodySmallSemiBold = GoogleFonts.getFont(
    _fontFamily,
    fontSize: 12,
    fontWeight: semiBold,
  );
  static TextStyle bodyXSmallSemiBold = GoogleFonts.getFont(
    _fontFamily,
    fontSize: 10,
    fontWeight: semiBold,
  );

  // Body Medium
  static TextStyle bodyXLargeMedium = GoogleFonts.getFont(
    _fontFamily,
    fontSize: 18,
    fontWeight: medium,
  );
  static TextStyle bodyLargeMedium = GoogleFonts.getFont(
    _fontFamily,
    fontSize: 16,
    fontWeight: medium,
  );
  static TextStyle bodyNormalMedium = GoogleFonts.getFont(
    _fontFamily,
    fontSize: 14,
    fontWeight: medium,
  );
  static TextStyle bodySmallMedium = GoogleFonts.getFont(
    _fontFamily,
    fontSize: 12,
    fontWeight: medium,
  );
  static TextStyle bodyXSmallMedium = GoogleFonts.getFont(
    _fontFamily,
    fontSize: 10,
    fontWeight: medium,
  );

  // Body Regular
  static TextStyle bodyXLarge = GoogleFonts.getFont(
    _fontFamily,
    fontSize: 18,
    fontWeight: regular, // Default to regular, can be overridden
  );
  static TextStyle bodyLarge = GoogleFonts.getFont(
    _fontFamily,
    fontSize: 16,
    fontWeight: regular,
  );
  static TextStyle bodyNormal = GoogleFonts.getFont(
    _fontFamily,
    fontSize: 14,
    fontWeight: regular,
  );
  static TextStyle bodySmall = GoogleFonts.getFont(
    _fontFamily,
    fontSize: 12,
    fontWeight: regular,
  );
  static TextStyle bodyXSmall = GoogleFonts.getFont(
    _fontFamily,
    fontSize: 10,
    fontWeight: regular,
  );
}
