import 'quilby_button.dart';

import 'package:flutter/material.dart';

class QuilbyBack extends StatelessWidget {
  final VoidCallback? onPressed;

  const QuilbyBack({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return QuilbyButton(
      onPressed: onPressed ?? () => Navigator.of(context).pop(),
      child: const Icon(Icons.arrow_back),
    );
  }
}
