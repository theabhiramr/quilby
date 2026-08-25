import "package:google_fonts/google_fonts.dart";

import "package:flutter/widgets.dart";

import "package:litnest/theme/app_colors.dart";

class AppTextStyles {
  static final TextStyle heading1 = GoogleFonts.libreBodoni(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.italic,
    color: AppColors.primary,
  );

  static final TextStyle heading2 = GoogleFonts.commissioner(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.primary,
  );

  static final TextStyle heading3 = GoogleFonts.commissioner(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.primary,
  );

  static final TextStyle body1 = GoogleFonts.commissioner(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
  );

  static final TextStyle body2 = GoogleFonts.commissioner(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );
}
