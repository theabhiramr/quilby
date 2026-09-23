import 'package:flutter/material.dart';

import 'package:quilby/theme/theme.dart';

class AuthInput extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool obscureText;
  final TextEditingController controller;

  const AuthInput({
    super.key,
    required this.icon,
    required this.label,
    this.obscureText = false,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Material(
          shape: const StadiumBorder(),
          color: Theme.of(context).brightness == Brightness.dark
              ? AppColors.inputFillDark
              : AppColors.inputFill,
          elevation: 3,
          shadowColor: AppColors.shadow,
          child: TextField(
            controller: controller,
            obscureText: obscureText,
            decoration: InputDecoration(
              prefixIcon: Icon(icon),
              prefixIconColor: WidgetStateColor.resolveWith(
                (states) => states.contains(WidgetState.focused)
                    ? AppColors.primary
                    : AppColors.onSurfaceMuted,
              ),
              hintText: label,
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(999)),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(999)),
                borderSide: BorderSide(color: AppColors.primary, width: 2),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 14,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
