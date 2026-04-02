import 'package:flutter/material.dart';

class AppColors {
  // Primary 'Elegance' Black/Dark Gray
  static const Color dark = Color(0xFF000000); // Or the exact Figma hex
  static const Color lighterDark = Color(0xFF1A1A1A);
  
  // Background/Surface
  static const Color background = Color(0xFFFBFBFB); // The slightly gray background
  static const Color cardBg = Color(0xFFFFFFFF);
  
  // Text Colors
  static const Color textMain = Color(0xFF333333);
  static const Color textHint = Color(0xFF999999);
  
  // Button Accent (Purple/Blue from the "checkout success")
  static const Color primaryButton = Color(0xFF868BF3); // Sampled from image
}

class AppTextStyles {
  // Brand Header (The Elegance.)
  static const TextStyle brandHeader = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.dark,
    letterSpacing: 0.5,
  );

  // Large Headings (Login, Signup, CHECKOUT)
  static const TextStyle screenHeading = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: AppColors.dark,
  );

  // Product Titles (Kera-Treat Hair Mask)
  static const TextStyle productTitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.dark,
  );

  // Body/Input Text
  static const TextStyle body = TextStyle(
    fontSize: 14,
    color: AppColors.textMain,
  );
  
  // Hint/Lighter text
  static const TextStyle hint = TextStyle(
    fontSize: 14,
    color: AppColors.textHint,
  );
}

class Dimens {
  static const double screenPadding = 24.0;
  static const double cardPadding = 16.0;
  static const double inputGap = 16.0;
  static const double inputRadius = 12.0;
}