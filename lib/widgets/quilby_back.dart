import 'package:flutter/material.dart';

class QuilbyBack extends StatelessWidget {
  final VoidCallback? onPressed;

  const QuilbyBack({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed ?? () => Navigator.of(context).pop(),
      icon: const Icon(Icons.arrow_back),
    );
  }
}
