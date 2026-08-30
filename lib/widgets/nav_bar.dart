import 'package:flutter/material.dart';
import 'package:quilby/theme/colors.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final String title;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final bool centerTitle;

  const NavBar({
    super.key,
    this.leading,
    required this.title,
    this.actions,
    this.backgroundColor,
    this.centerTitle = false,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final effectiveBackground =
        backgroundColor ?? Theme.of(context).scaffoldBackgroundColor;
    final titleColor =
        ThemeData.estimateBrightnessForColor(effectiveBackground) ==
            Brightness.dark
        ? Colors.white
        : AppColors.textPrimary;

    return AppBar(
      title: Padding(
        padding: const EdgeInsets.only(bottom: 6),
        child: Text(
          title,
          style: TextStyle(
            color: titleColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      leading: leading == null ? null : Center(child: leading),
      centerTitle: centerTitle,
      backgroundColor: effectiveBackground,
      actions: actions,
      elevation: 0,
      shape: const RoundedRectangleBorder(
        side: BorderSide(color: AppColors.shadow, width: 1),
      ),
    );
  }
}
