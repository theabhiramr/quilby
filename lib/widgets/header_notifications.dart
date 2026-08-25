import 'package:picons/picons.dart';

import 'package:flutter/material.dart';

import 'package:quilby/theme/theme.dart';
import 'package:quilby/widgets/header_icon_button.dart';

class HeaderNotifications extends StatelessWidget {
  const HeaderNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    return HeaderIconButton(
      onPressed: () {
        // Handle notification action
      },
      icon: Picon(
        PiconsDuotone.bell,
        color: AppColors.secondary,
        duoColor: AppColors.primary,
        size: 24,
      ),
    );
  }
}
