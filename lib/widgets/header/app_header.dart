import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:quilby/theme/colors.dart';
import 'package:quilby/theme/text_styles.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget> actions;
  final Widget? leading;
  final bool centerTitle;
  final Color? backgroundColor;
  final TextStyle? titleStyle;

  const Header({
    super.key,
    required this.title,
    required this.actions,
    this.leading,
    this.centerTitle = true,
    this.backgroundColor,
    this.titleStyle,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final Color effectiveBackground =
        backgroundColor ?? Theme.of(context).colorScheme.primary;
    final bool isDarkBackground =
        effectiveBackground != Colors.transparent &&
        ThemeData.estimateBrightnessForColor(effectiveBackground) ==
            Brightness.dark;
    final Color titleColor = effectiveBackground == Colors.transparent
        ? AppColors.primary
        : isDarkBackground
        ? AppColors.onPrimary
        : AppColors.textPrimary;

    return AppBar(
      title: Padding(
        padding: const EdgeInsets.only(bottom: 6),
        child: Text(
          title,
          style: (titleStyle ?? AppTextStyles.heading2).copyWith(
            color: titleColor,
          ),
        ),
      ),
      leading: leading == null ? null : Center(child: leading),
      centerTitle: centerTitle,
      backgroundColor: effectiveBackground,
      actions: actions,
      elevation: 3,
      scrolledUnderElevation: 3,
      shadowColor: AppColors.shadow,
      // A transparent bar shows the light scaffold background behind it, and an
      // opaque bar here is never dark — so status bar icons should stay dark too.
      // AppBar's own default estimates brightness from the raw backgroundColor,
      // which reads Colors.transparent (0x00000000) as black.
      systemOverlayStyle: isDarkBackground
          ? SystemUiOverlayStyle.light
          : SystemUiOverlayStyle.dark,
    );
  }
}
