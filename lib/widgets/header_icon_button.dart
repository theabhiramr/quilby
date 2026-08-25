import 'package:flutter/material.dart';

import 'package:quilby/theme/theme.dart';

class HeaderIconButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback onPressed;
  final double size;
  final double elevation;

  const HeaderIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.size = 42,
    this.elevation = 3,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.surface,
      shape: const CircleBorder(),
      elevation: elevation,
      shadowColor: AppColors.shadow,
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onPressed,
        child: SizedBox(
          width: size,
          height: size,
          child: Center(child: icon),
        ),
      ),
    );
  }
}
