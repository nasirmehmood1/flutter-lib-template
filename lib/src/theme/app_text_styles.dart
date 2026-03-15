import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';
import 'app_colors.dart' as AppColors;

/// Reusable text style definitions.
///
/// Uses [flutter_screenutil] `.sp` for responsive font sizing.
/// Reference these styles throughout the app instead of defining
/// ad-hoc text styles in widget trees.
/// TextStyle get regularWhiteTextSize12 => TextStyle(


///example how we will make the colours
//     fontWeight: FontWeight.w400,
//     fontFamily: poppinsFont,
//     color: appWhiteColor,
//     fontStyle: FontStyle.normal,
//     fontSize: 12.sp);
//
// TextStyle get mediumWhiteTextSize12 => TextStyle(
//     fontWeight: FontWeight.w500,
//     fontFamily: poppinsFont,
//     color: appWhiteColor,
//     fontStyle: FontStyle.normal,
//     fontSize: 12.sp);
//
// TextStyle get semiBoldWhiteTextSize12 => TextStyle(
//     fontWeight: FontWeight.w600,
//     fontFamily: poppinsFont,
//     color: appWhiteColor,
//     fontStyle: FontStyle.normal,
//     fontSize: 12.sp);
//
// TextStyle get boldWhiteTextSize12 => TextStyle(
//     fontWeight: FontWeight.w700,
//     fontFamily: poppinsFont,
//     color: appWhiteColor,
//     fontStyle: FontStyle.normal,
//     fontSize: 12.sp);
//
// TextStyle get extraBoldWhiteTextSize12 => TextStyle(
//     fontWeight: FontWeight.w800,
//     fontFamily: poppinsFont,
//     color: appWhiteColor,
//     fontStyle: FontStyle.normal,
//     fontSize: 12.sp);
//
// */

// Text Style with appWhiteColor

TextStyle get regularWhiteTextStyle => TextStyle(
    fontWeight: FontWeight.w400,
    color: appWhiteColor,
    fontStyle: FontStyle.normal);

TextStyle get mediumWhiteTextStyle => TextStyle(
    fontWeight: FontWeight.w500,
    color: appWhiteColor,
    fontStyle: FontStyle.normal);

TextStyle get semiBoldWhiteTextStyle => TextStyle(
    fontWeight: FontWeight.w600,
    color: appWhiteColor,
    fontStyle: FontStyle.normal);

TextStyle get boldWhiteTextStyle => TextStyle(
    fontWeight: FontWeight.w700,
    color: appWhiteColor,
    fontStyle: FontStyle.normal);

TextStyle get extraBoldWhiteTextStyle => TextStyle(
    fontWeight: FontWeight.w800,
    color: appWhiteColor,
    fontStyle: FontStyle.normal);

// Text Style with neutralGrayColor

TextStyle get regularNeutralGreyTextStyle => TextStyle(
    fontWeight: FontWeight.w400,
    color: neutralGrayColor,
    fontStyle: FontStyle.normal);

TextStyle get mediumNeutralGreyTextStyle => TextStyle(
    fontWeight: FontWeight.w500,
    color: neutralGrayColor,
    fontStyle: FontStyle.normal);

TextStyle get semiBoldNeutralGreyTextStyle => TextStyle(
    fontWeight: FontWeight.w600,
    color: neutralGrayColor,
    fontStyle: FontStyle.normal);

TextStyle get boldNeutralGreyTextStyle => TextStyle(
    fontWeight: FontWeight.w700,
    color: neutralGrayColor,
    fontStyle: FontStyle.normal);

TextStyle get extraBoldNeutralGreyTextStyle => TextStyle(
    fontWeight: FontWeight.w800,
    color: neutralGrayColor,
    fontStyle: FontStyle.normal);

