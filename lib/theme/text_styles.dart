import "package:google_fonts/google_fonts.dart";

import "package:flutter/material.dart";

import "package:quilby/theme/colors.dart";

class AppTextStyles {
  static bool _isDark(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark;

  static TextStyle title(BuildContext context) => GoogleFonts.fraunces(
    fontSize: 48,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.italic,
    letterSpacing: 1.8,
    color: _isDark(context) ? AppColors.secondaryLight : AppColors.primary,
  );

  static TextStyle heading1(BuildContext context) => GoogleFonts.commissioner(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    color: _isDark(context) ? AppColors.secondaryLight : AppColors.primary,
  );

  static TextStyle heading2(BuildContext context) => GoogleFonts.commissioner(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: _isDark(context) ? AppColors.secondaryLight : AppColors.primary,
  );

  static TextStyle heading3(BuildContext context) => GoogleFonts.commissioner(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: _isDark(context) ? AppColors.secondaryLight : AppColors.primary,
  );

  static TextStyle body1(BuildContext context) => GoogleFonts.commissioner(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: _isDark(context) ? AppColors.textPrimaryDark : AppColors.textPrimary,
  );

  static TextStyle body2(BuildContext context) => GoogleFonts.commissioner(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: _isDark(context)
        ? AppColors.textSecondaryDark
        : AppColors.textSecondary,
  );
}
