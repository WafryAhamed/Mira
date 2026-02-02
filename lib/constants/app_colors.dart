import 'package:flutter/material.dart';

/// App color palette for Mira Banking App
/// Using a warm Lemon Yellow theme with clean white background
class AppColors {
  AppColors._();

  // Primary Colors
  static const Color primary = Color(0xFFF9C846); // Lemon Yellow
  static const Color primaryLight = Color(0xFFFBD978); // Light Yellow
  static const Color primaryDark = Color(0xFFE5B43D); // Dark Yellow

  // Background Colors
  static const Color background = Color(0xFFFFFFFF); // White
  static const Color surface = Color(0xFFFAFAFA); // Off White
  static const Color accent = Color(0xFFF2F2F2); // Soft Gray

  // Text Colors
  static const Color textPrimary = Color(0xFF222222); // Dark Charcoal
  static const Color textSecondary = Color(0xFF666666); // Gray
  static const Color textLight = Color(0xFF999999); // Light Gray
  static const Color textOnPrimary = Color(0xFF222222); // Text on yellow

  // Status Colors
  static const Color success = Color(0xFF43A047); // Green
  static const Color error = Color(0xFFE53935); // Red
  static const Color warning = Color(0xFFFFA726); // Orange
  static const Color info = Color(0xFF29B6F6); // Blue

  // Utility Colors
  static const Color divider = Color(0xFFE0E0E0);
  static const Color disabled = Color(0xFFBDBDBD);
  static const Color overlay = Color(0x80000000);
  static const Color shadow = Color(0x1A000000);

  // Gradient
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primaryLight, primary],
  );

  static const LinearGradient splashGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFFFBE7A8), primary],
  );
}
