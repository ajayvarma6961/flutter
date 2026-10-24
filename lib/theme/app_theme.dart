import 'package:flutter/material.dart';

class AppTheme {
  // Brand color palette - Forest Green & Warm Off-White
  static const Color primaryGreen = Color(0xFF1B4931);
  static const Color primaryGreenLight = Color(0xFF2D6A4F);
  static const Color forestAccent = Color(0xFF40916C);
  static const Color leafTint = Color(0xFFEBF5EE);
  static const Color leafBorder = Color(0xFFD3E7D9);

  static const Color warmOffWhite = Color(0xFFF8F7F3);
  static const Color warmSurface = Color(0xFFFFFFFF);
  static const Color surfaceMuted = Color(0xFFF2EFE9);
  static const Color warmBorder = Color(0xFFE5E1D8);

  static const Color textHigh = Color(0xFF19201C);
  static const Color textMedium = Color(0xFF455149);
  static const Color textMuted = Color(0xFF6E7A72);

  static const Color amberHighlight = Color(0xFFD48B28);
  static const Color amberContainer = Color(0xFFFDF4E5);

  static ThemeData lightTheme() {
    final baseScheme = ColorScheme.fromSeed(
      seedColor: primaryGreen,
      brightness: Brightness.light,
      primary: primaryGreen,
      onPrimary: Colors.white,
      primaryContainer: leafTint,
      onPrimaryContainer: primaryGreen,
      secondary: primaryGreenLight,
      onSecondary: Colors.white,
      secondaryContainer: const Color(0xFFD8F3DC),
      onSecondaryContainer: const Color(0xFF081C15),
      surface: warmSurface,
      onSurface: textHigh,
      surfaceContainerHighest: surfaceMuted,
      outline: warmBorder,
      outlineVariant: const Color(0xFFEDE9E1),
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: baseScheme,
      scaffoldBackgroundColor: warmOffWhite,
      canvasColor: warmOffWhite,
      fontFamily: null, // Uses system font with clear readability
      appBarTheme: const AppBarTheme(
        backgroundColor: warmOffWhite,
        foregroundColor: textHigh,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w700,
          color: primaryGreen,
          letterSpacing: -0.3,
        ),
      ),
      cardTheme: CardThemeData(
        color: warmSurface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: warmBorder, width: 1.0),
        ),
        margin: EdgeInsets.zero,
      ),
      chipTheme: ChipThemeData(
        backgroundColor: surfaceMuted,
        selectedColor: primaryGreen,
        secondarySelectedColor: primaryGreen,
        labelStyle: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: textHigh,
        ),
        secondaryLabelStyle: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
          side: const BorderSide(color: Colors.transparent),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryGreen,
          foregroundColor: Colors.white,
          minimumSize: const Size(48, 48), // WCAG touch target
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.1,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: primaryGreen,
          minimumSize: const Size(48, 48),
          side: const BorderSide(color: primaryGreen, width: 1.5),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: warmSurface,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: warmBorder, width: 1.2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: warmBorder, width: 1.2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: primaryGreen, width: 2.0),
        ),
        hintStyle: const TextStyle(
          color: textMuted,
          fontSize: 15,
          fontWeight: FontWeight.w400,
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: warmBorder,
        thickness: 1,
        space: 1,
      ),
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: textHigh,
          borderRadius: BorderRadius.circular(8),
        ),
        textStyle: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        waitDuration: const Duration(milliseconds: 400),
      ),
    );
  }
}
