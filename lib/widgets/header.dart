import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:quilby/theme/app_colors.dart';
import 'package:quilby/theme/app_text_styles.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget> actions;
  final Widget? leading;
  final bool centerTitle;
  final Color? backgroundColor;

  const Header({
    super.key,
    required this.title,
    required this.actions,
    this.leading,
    this.centerTitle = true,
    this.backgroundColor,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final Color effectiveBackground = backgroundColor ?? Theme.of(context).colorScheme.primary;
    final bool isDarkBackground = effectiveBackground != Colors.transparent &&
        ThemeData.estimateBrightnessForColor(effectiveBackground) == Brightness.dark;
    final Color titleColor = effectiveBackground == Colors.transparent
        ? AppColors.primary
        : isDarkBackground
            ? AppColors.onPrimary
            : AppColors.textPrimary;

    return AppBar(
      title: Text(title, style: AppTextStyles.heading1.copyWith(color: titleColor)),
      leading: leading,
      centerTitle: centerTitle,
      backgroundColor: effectiveBackground,
      actions: actions,
      elevation: 0,
      shape: const Border(bottom: BorderSide(color: AppColors.secondaryLight, width: 1)),
      // A transparent bar shows the light scaffold background behind it, and an
      // opaque bar here is never dark — so status bar icons should stay dark too.
      // AppBar's own default estimates brightness from the raw backgroundColor,
      // which reads Colors.transparent (0x00000000) as black.
      systemOverlayStyle: isDarkBackground ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
    );
  }
}
