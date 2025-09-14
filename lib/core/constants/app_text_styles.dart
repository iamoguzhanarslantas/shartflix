import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyles {
  AppTextStyles._();

  // Font Families
  static const String _fontFamilyInstrumentSans = 'Instrument Sans';
  static const String _fontFamilyMontserrat = 'Montserrat';

  // Font Weights
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight regular = FontWeight.w400;

  // Headings
  static final TextStyle h1 = TextStyle(
    fontFamily: _fontFamilyInstrumentSans,
    fontSize: 48.sp,
    fontWeight: bold,
  );
  static final TextStyle h2 = TextStyle(
    fontFamily: _fontFamilyInstrumentSans,
    fontSize: 40.sp,
    fontWeight: bold,
  );
  static final TextStyle h3 = TextStyle(
    fontFamily: _fontFamilyInstrumentSans,
    fontSize: 32.sp,
    fontWeight: bold,
  );
  static final TextStyle h4 = TextStyle(
    fontFamily: _fontFamilyInstrumentSans,
    fontSize: 24.sp,
    fontWeight: bold,
  );
  static final TextStyle h5 = TextStyle(
    fontFamily: _fontFamilyInstrumentSans,
    fontSize: 20.sp,
    fontWeight: bold,
  );
  static final TextStyle h6 = TextStyle(
    fontFamily: _fontFamilyInstrumentSans,
    fontSize: 18.sp,
    fontWeight: bold,
  );

  // Body Bold
  static final TextStyle bodyXLargeBold = TextStyle(
    fontFamily: _fontFamilyInstrumentSans,
    fontSize: 18.sp,
    fontWeight: bold,
  );
  static final TextStyle bodyLargeBold = TextStyle(
    fontFamily: _fontFamilyInstrumentSans,
    fontSize: 16.sp,
    fontWeight: bold,
  );
  static final TextStyle bodyNormalBold = TextStyle(
    fontFamily: _fontFamilyInstrumentSans,
    fontSize: 14.sp,
    fontWeight: bold,
  );
  static final TextStyle bodySmallBold = TextStyle(
    fontFamily: _fontFamilyInstrumentSans,
    fontSize: 12.sp,
    fontWeight: bold,
  );
  static final TextStyle bodyXSmallBold = TextStyle(
    fontFamily: _fontFamilyInstrumentSans,
    fontSize: 10.sp,
    fontWeight: bold,
  );

  // Body SemiBold
  static final TextStyle bodyXLargeSemiBold = TextStyle(
    fontFamily: _fontFamilyInstrumentSans,
    fontSize: 18.sp,
    fontWeight: semiBold,
  );
  static final TextStyle bodyLargeSemiBold = TextStyle(
    fontFamily: _fontFamilyInstrumentSans,
    fontSize: 16.sp,
    fontWeight: semiBold,
  );
  static final TextStyle bodyNormalSemiBold = TextStyle(
    fontFamily: _fontFamilyInstrumentSans,
    fontSize: 14.sp,
    fontWeight: semiBold,
  );
  static final TextStyle bodySmallSemiBold = TextStyle(
    fontFamily: _fontFamilyInstrumentSans,
    fontSize: 12.sp,
    fontWeight: semiBold,
  );
  static final TextStyle bodyXSmallSemiBold = TextStyle(
    fontFamily: _fontFamilyInstrumentSans,
    fontSize: 10.sp,
    fontWeight: semiBold,
  );

  // Body Medium
  static final TextStyle bodyXLargeMedium = TextStyle(
    fontFamily: _fontFamilyInstrumentSans,
    fontSize: 18.sp,
    fontWeight: medium,
  );
  static final TextStyle bodyLargeMedium = TextStyle(
    fontFamily: _fontFamilyInstrumentSans,
    fontSize: 16.sp,
    fontWeight: medium,
  );
  static final TextStyle bodyNormalMedium = TextStyle(
    fontFamily: _fontFamilyInstrumentSans,
    fontSize: 14.sp,
    fontWeight: medium,
  );
  static final TextStyle bodySmallMedium = TextStyle(
    fontFamily: _fontFamilyInstrumentSans,
    fontSize: 12.sp,
    fontWeight: medium,
  );
  static final TextStyle bodyXSmallMedium = TextStyle(
    fontFamily: _fontFamilyInstrumentSans,
    fontSize: 10.sp,
    fontWeight: medium,
  );

  // Body Regular
  static final TextStyle bodyXLargeRegular = TextStyle(
    fontFamily: _fontFamilyInstrumentSans,
    fontSize: 18.sp,
    fontWeight: regular,
  );
  static final TextStyle bodyLargeRegular = TextStyle(
    fontFamily: _fontFamilyInstrumentSans,
    fontSize: 16.sp,
    fontWeight: regular,
  );
  static final TextStyle bodyNormalRegular = TextStyle(
    fontFamily: _fontFamilyInstrumentSans,
    fontSize: 14.sp,
    fontWeight: regular,
  );
  static final TextStyle bodySmallRegular = TextStyle(
    fontFamily: _fontFamilyInstrumentSans,
    fontSize: 12.sp,
    fontWeight: regular,
  );
  static final TextStyle bodyXSmallRegular = TextStyle(
    fontFamily: _fontFamilyInstrumentSans,
    fontSize: 10.sp,
    fontWeight: regular,
  );

  // Custom styles for Profile Page
  static final TextStyle profileLimitedOffer = TextStyle(
    fontFamily: _fontFamilyMontserrat,
    fontSize: 12.sp,
    fontWeight: semiBold,
  );
}
