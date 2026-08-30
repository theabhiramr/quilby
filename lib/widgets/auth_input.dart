import 'package:flutter/material.dart';

import 'package:quilby/theme/theme.dart';

class AuthInput extends StatelessWidget {
  final String label;
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;

  const AuthInput({
    super.key,
    required this.label,
    required this.hintText,
    this.obscureText = false,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyles.heading3(context)),
        const SizedBox(height: 8),
        Material(
          shape: const StadiumBorder(),
          color: Theme.of(context).colorScheme.surface,
          elevation: 3,
          shadowColor: AppColors.shadow,
          child: TextField(
            controller: controller,
            obscureText: obscureText,
            decoration: InputDecoration(
              hintText: hintText,
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
