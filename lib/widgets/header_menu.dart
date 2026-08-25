import 'package:picons/picons.dart';

import 'package:flutter/material.dart';

import 'package:quilby/theme/theme.dart';

class HeaderMenu extends StatelessWidget {
  const HeaderMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Picon(
        PiconsDuotone.list,
        color: AppColors.secondary,
        duoColor: AppColors.primary,
        size: 28,
      ),
      onPressed: () {
        // Handle menu action
      },
    );
  }
}
