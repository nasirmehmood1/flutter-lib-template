import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';
import 'app_text_styles.dart';

/// Application theme definitions.
///
/// Provides light and dark [ThemeData] configurations.
/// Used by [MaterialApp] in [MainActivity].
ThemeData lightThemeData() {
  return ThemeData(
      colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: appPrimaryColor,
          onPrimary: appWhiteColor,
          secondary: secondary,
          onSecondary: appBlackColor,
          error: appErrorColor,
          onError: appErrorColor,
          surface: appWhiteColor,
          onSurface: appBlackColor),
      dialogTheme: DialogThemeData(
        backgroundColor: appWhiteColor,
      ),
      splashFactory: NoSplash.splashFactory,
      textTheme: GoogleFonts.interTextTheme(),
      brightness: Brightness.light,
      primaryColor: appPrimaryColor,
      scaffoldBackgroundColor: appWhiteColor,
      splashColor: appPrimaryColor,
      hintColor: neutralGrayColor,
      textSelectionTheme: TextSelectionThemeData(
          selectionHandleColor: appPrimaryColor, cursorColor: appPrimaryColor),
      progressIndicatorTheme:
      ProgressIndicatorThemeData(color: appPrimaryColor),
      inputDecorationTheme: InputDecorationTheme(
          suffixIconColor: WidgetStateColor.resolveWith(
                  (states) => states.contains(WidgetState.error)
                  ? appErrorColor
                  : states.contains(WidgetState.focused)
                  ? appPrimaryColor
                  : silverMistColor),
          hintStyle: semiBoldNeutralGreyTextStyle.copyWith(fontSize: 16),
          // errorStyle: regularRoseFlushTextStyle.copyWith(fontSize: 12),
          enabledBorder: _outlineInputBorder(borderColor: silverMistColor),
          border: _outlineInputBorder(borderColor: silverMistColor),
          focusedBorder: _outlineInputBorder(borderColor: appPrimaryColor),
          errorBorder: _outlineInputBorder(borderColor: appErrorColor),
          focusedErrorBorder: _outlineInputBorder(borderColor: appErrorColor)),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          fixedSize: WidgetStateProperty.all<Size>(
            const Size.fromHeight(50.0),
          ),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(6)),
                  side: BorderSide(color: appPrimaryColor))),
          shadowColor: WidgetStateProperty.all(Colors.transparent),
          elevation: WidgetStateProperty.all(0),
          foregroundColor: WidgetStateProperty.all(appWhiteColor),
          backgroundColor: WidgetStateProperty.all(appPrimaryColor),
          alignment: Alignment.center,
          textStyle: WidgetStateProperty.resolveWith(
                  (states) => mediumWhiteTextStyle.copyWith(fontSize: 16)),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: appWhiteColor,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: GoogleFonts.poppins(
              fontSize: 12,
              // fontWeight: semiBoldEmeraldGreenTextStyle.fontWeight,
              color: emeraldGreenColor,
              // fontStyle: regularEmeraldGreenTextStyle.fontStyle
          ),
          unselectedLabelStyle: GoogleFonts.poppins(
              fontSize: 12,
              // fontWeight: regularStormGreyTextStyle.fontWeight,
              color: cloudGreyColor,
              // fontStyle: regularStormGreyTextStyle.fontStyle
          )));
}

/// Returns an input border with the specified [borderColor] and [borderWidth].
InputBorder _outlineInputBorder(
    {Color borderColor = const Color(0xFF000000), double borderWidth = 1.0}) {
  return OutlineInputBorder(
      borderSide: BorderSide(color: borderColor, width: borderWidth),
      borderRadius: BorderRadius.circular(6.0));
}

