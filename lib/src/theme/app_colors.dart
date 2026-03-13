import 'package:flutter/material.dart';

/// Centralized color constants for the application.
///
/// All colors used across the app should be defined here
/// to maintain a consistent visual identity.
class AppColors {
  AppColors._();

  // ---------------------------------------------------------------------------
  // Primary Colors
  // ---------------------------------------------------------------------------

  /// Primary brand color.
  static const Color primary = Color(0xFF6200EE);

  /// Lighter shade of the primary color.
  static const Color primaryLight = Color(0xFFBB86FC);

  /// Darker shade of the primary color.
  static const Color primaryDark = Color(0xFF3700B3);

  // ---------------------------------------------------------------------------
  // Secondary Colors
  // ---------------------------------------------------------------------------

  /// Secondary/accent color.
  static const Color secondary = Color(0xFF03DAC6);

  /// Darker shade of the secondary color.
  static const Color secondaryDark = Color(0xFF018786);

  // ---------------------------------------------------------------------------
  // Neutral Colors
  // ---------------------------------------------------------------------------

  /// Background color for light theme.
  static const Color background = Color(0xFFF5F5F5);

  /// Surface/card color.
  static const Color surface = Color(0xFFFFFFFF);

  /// Error/danger color.
  static const Color error = Color(0xFFB00020);

  /// Success/confirmation color.
  static const Color success = Color(0xFF4CAF50);

  /// Warning color.
  static const Color warning = Color(0xFFFFC107);

  // ---------------------------------------------------------------------------
  // Text Colors
  // ---------------------------------------------------------------------------

  /// Primary text color on light backgrounds.
  static const Color textPrimary = Color(0xFF212121);

  /// Secondary/muted text color.
  static const Color textSecondary = Color(0xFF757575);

  /// Text color on primary-colored backgrounds.
  static const Color textOnPrimary = Color(0xFFFFFFFF);

  // ---------------------------------------------------------------------------
  // Dark Theme Colors
  // ---------------------------------------------------------------------------

  /// Dark theme background.
  static const Color darkBackground = Color(0xFF121212);

  /// Dark theme surface.
  static const Color darkSurface = Color(0xFF1E1E1E);

  /// Text color on dark backgrounds.
  static const Color textOnDark = Color(0xFFFFFFFF);
}
