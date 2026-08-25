import 'package:flutter/material.dart';

import 'package:quilby/theme/colors.dart';

class AppBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  final List<NavigationDestination> destinations;

  const AppBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
    required this.destinations,
  });

  @override
  Widget build(BuildContext context) {
    // NavigationBar wraps itself in a SafeArea internally, so the bottom
    // safe-area inset is already applied inside it. Strip it here so this
    // outer margin doesn't add that same inset a second time.
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final double bottomInset = mediaQuery.padding.bottom;

    return Padding(
      padding: EdgeInsets.fromLTRB(16, 0, 16, bottomInset + 16),
      child: Material(
        color: AppColors.surface,
        shadowColor: AppColors.shadow,
        elevation: 8,
        shape: const StadiumBorder(),
        clipBehavior: Clip.antiAlias,
        child: MediaQuery(
          data: mediaQuery.removePadding(removeBottom: true),
          child: NavigationBar(
            selectedIndex: selectedIndex,
            onDestinationSelected: onDestinationSelected,
            backgroundColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            indicatorColor: AppColors.primaryLight.withValues(alpha: 0.25),
            indicatorShape: const CircleBorder(),

            elevation: 0,
            height: 64,
            destinations: destinations,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          ),
        ),
      ),
    );
  }
}
