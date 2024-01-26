import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/presentation/resources/colors/app_colors.dart';
import '../../core/presentation/resources/dimensions/app_dimension.dart';
import '../measurement.dart';

class AppFontSize {
  static double get tooSmallTextSize => AppDimension().tooSmallTextSize;

  static double get smallTextSize => AppDimension().smallTextSize;

  static double get mediumTextSize => AppDimension().mediumTextSize;

  static double get largeTextSize => AppDimension().largeTextSize;

  static double get appBarTextSize => AppDimension().appBarTextSize;

  static double get semiLargeTextSize => AppDimension().semiLargeTextSize;

  static double get extraLargeTextSize => AppDimension().extraLargeTextSize;

  static double get splashScreenTextSize => AppDimension().splashScreenTextSize;
}

class AppTextStyle {
  AppColors appColors = AppColors();

  TextStyle get appBarTextStyle => TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: measurement.textSize(AppFontSize.appBarTextSize));

  TextStyle customTextStyle(
      {Color? color, double? size, double? height, FontWeight? fontWeight}) {
    return GoogleFonts.poppins(
      fontSize: measurement.textSize(size ?? 16),
      fontWeight: fontWeight ?? FontWeight.w500,
      height: height,
      color: color ?? appColors.black600,
    );
  }

  TextStyle w400s14([Color? color]) {
    return GoogleFonts.poppins(
      fontSize: measurement.textSize(14),
      fontWeight: FontWeight.w400,
      color: color ?? appColors.black600,
    );
  }

  TextStyle w500s10([Color? color]) {
    return GoogleFonts.poppins(
      fontSize: measurement.textSize(10),
      fontWeight: FontWeight.w500,
      color: color ?? appColors.black600,
    );
  }

  TextStyle w500s12([Color? color]) {
    return GoogleFonts.poppins(
      fontSize: measurement.textSize(12),
      fontWeight: FontWeight.w500,
      color: color ?? appColors.black600,
    );
  }

  TextStyle w500s14([Color? color]) {
    return GoogleFonts.poppins(
      fontSize: measurement.textSize(14),
      fontWeight: FontWeight.w500,
      color: color ?? appColors.black600,
    );
  }

  TextStyle w600s14([Color? color]) {
    return GoogleFonts.poppins(
      fontSize: measurement.textSize(14),
      fontWeight: FontWeight.w600,
      color: color ?? appColors.black600,
    );
  }

  TextStyle w400s16([Color? color]) {
    return GoogleFonts.poppins(
      fontSize: measurement.textSize(16),
      fontWeight: FontWeight.w400,
      color: color ?? appColors.black600,
    );
  }

  TextStyle w500s16([Color? color]) {
    return GoogleFonts.poppins(
      fontSize: measurement.textSize(16),
      fontWeight: FontWeight.w500,
      color: color ?? appColors.black600,
    );
  }

  TextStyle w600s16([Color? color]) {
    return GoogleFonts.poppins(
      fontSize: measurement.textSize(16),
      fontWeight: FontWeight.w600,
      color: color ?? appColors.black600,
    );
  }

  TextStyle w700s16([Color? color, double? height]) {
    return GoogleFonts.poppins(
      fontSize: measurement.textSize(16),
      fontWeight: FontWeight.w700,
      letterSpacing: 0.4,
      color: color ?? appColors.black600,
      height: height ?? 1,
    );
  }

  TextStyle w700s18([Color? color, double? height]) {
    return GoogleFonts.poppins(
      fontSize: measurement.textSize(18),
      fontWeight: FontWeight.w700,
      color: color ?? appColors.black600,
      height: height ?? 1,
    );
  }

  TextStyle w800s16([Color? color]) {
    return GoogleFonts.poppins(
      fontSize: measurement.textSize(16),
      fontWeight: FontWeight.w800,
      color: color ?? appColors.black600,
    );
  }

  TextStyle w500s20([Color? color]) {
    return GoogleFonts.poppins(
      fontSize: measurement.textSize(20),
      fontWeight: FontWeight.w500,
      color: color ?? appColors.black600,
    );
  }

  TextStyle w500s22([Color? color]) {
    return GoogleFonts.poppins(
      fontSize: measurement.textSize(22),
      fontWeight: FontWeight.w500,
      color: color ?? appColors.black600,
    );
  }

  TextStyle w500s24([Color? color]) {
    return GoogleFonts.poppins(
      fontSize: measurement.textSize(24),
      fontWeight: FontWeight.w500,
      color: color ?? appColors.black600,
    );
  }

  TextStyle w500s32([Color? color]) {
    return GoogleFonts.poppins(
      fontSize: measurement.textSize(32),
      fontWeight: FontWeight.w500,
      color: color ?? appColors.black600,
    );
  }

  TextStyle w400s12([Color? color]) {
    return GoogleFonts.poppins(
      fontSize: measurement.textSize(12),
      fontWeight: FontWeight.w400,
      color: color ?? appColors.black600,
    );
  }

  TextStyle w400s18([Color? color]) {
    return GoogleFonts.poppins(
      fontSize: measurement.textSize(18),
      fontWeight: FontWeight.w400,
      color: color ?? appColors.black600,
    );
  }

  TextStyle w400s20([Color? color]) {
    return GoogleFonts.poppins(
      fontSize: measurement.textSize(20),
      fontWeight: FontWeight.w400,
      color: color ?? appColors.black600,
    );
  }

  TextStyle w400s22([Color? color]) {
    return GoogleFonts.poppins(
      fontSize: measurement.textSize(22),
      fontWeight: FontWeight.w400,
      color: color ?? appColors.black600,
    );
  }

  TextStyle w600s12([Color? color]) {
    return GoogleFonts.poppins(
      fontSize: measurement.textSize(12),
      fontWeight: FontWeight.w600,
      color: color ?? appColors.black600,
    );
  }

  TextStyle w800s26([Color? color]) {
    return GoogleFonts.poppins(
      fontSize: measurement.textSize(26),
      fontWeight: FontWeight.w800,
      color: color ?? appColors.black600,
    );
  }

  TextStyle w800s40([Color? color]) {
    return GoogleFonts.poppins(
      fontSize: measurement.textSize(40),
      fontWeight: FontWeight.w800,
      color: color ?? appColors.black600,
    );
  }
}
