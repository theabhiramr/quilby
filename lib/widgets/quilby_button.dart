import 'package:picons/picons.dart';

import 'package:flutter/material.dart';

import 'package:quilby/theme/theme.dart';

class QuilbyButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const QuilbyButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
      ),
      child: Text(
        text,
        style: AppTextStyles.body1.copyWith(color: Colors.white),
      ),
    );
  }
}
