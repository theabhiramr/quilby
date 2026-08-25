import 'package:picons/picons.dart';

import 'package:flutter/material.dart';

import 'package:quilby/theme/theme.dart';
import 'package:quilby/widgets/header/header_icon_button.dart';

class HeaderMenu extends StatelessWidget {
  const HeaderMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return HeaderIconButton(
      onPressed: () {
        // Handle menu action
      },
      icon: Picon(
        PiconsDuotone.list,
        color: AppColors.secondary,
        duoColor: AppColors.primary,
        size: 24,
      ),
    );
  }
}
