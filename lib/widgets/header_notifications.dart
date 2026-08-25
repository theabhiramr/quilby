import 'package:picons/picons.dart';

import 'package:flutter/material.dart';

import 'package:quilby/theme/theme.dart';

class HeaderNotifications extends StatelessWidget {
  const HeaderNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Picon(
        PiconsDuotone.bell,
        color: AppColors.secondary,
        duoColor: AppColors.primary,
        size: 28,
      ),
      onPressed: () {
        // Handle notification action
      },
    );
  }
}
