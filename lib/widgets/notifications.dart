import 'package:phosphor_flutter/phosphor_flutter.dart';

import 'package:flutter/material.dart';

import 'package:quilby/theme/theme.dart';

class NotificationsAction extends StatelessWidget {
  const NotificationsAction({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: PhosphorIcon(PhosphorIconsDuotone.bell, color: AppColors.secondary),
      onPressed: () {
        // Handle notification action
      },
    );
  }
}
