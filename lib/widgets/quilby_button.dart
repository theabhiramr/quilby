import 'package:picons/picons.dart';

import 'package:flutter/material.dart';

import 'package:quilby/theme/theme.dart';

class QuilbyButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const QuilbyButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 3,
          shadowColor: AppColors.shadow,
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.onPrimary,
          shape: const StadiumBorder(),
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
        child: Text(
          text,
          style: AppTextStyles.body1(context).copyWith(
            color: AppColors.onPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
