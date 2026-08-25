import 'package:flutter/material.dart';
import 'package:picons/picons.dart';

import 'package:quilby/theme/colors.dart';

class NavBarItem {
  final PiconDuotoneData icon;
  final String label;

  const NavBarItem({required this.icon, required this.label});
}

class AppBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  final List<NavBarItem> items;
  final VoidCallback onAddPressed;

  const AppBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
    required this.items,
    required this.onAddPressed,
  });

  @override
  Widget build(BuildContext context) {
    final double bottomInset = MediaQuery.paddingOf(context).bottom;
    final int centerIndex = items.length ~/ 2;

    return Padding(
      padding: EdgeInsets.fromLTRB(16, 0, 16, bottomInset + 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Material(
            color: AppColors.surface,
            shadowColor: AppColors.shadow,
            elevation: 8,
            shape: const StadiumBorder(),
            clipBehavior: Clip.antiAlias,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: 64,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (int i = 0; i < items.length; i++) ...[
                      if (i == centerIndex) ...[
                        const SizedBox(width: 14),
                        _AddButton(onPressed: onAddPressed),
                        const SizedBox(width: 14),
                      ] else if (i > 0)
                        const SizedBox(width: 14),
                      _NavBarTapTarget(
                        item: items[i],
                        selected: i == selectedIndex,
                        onTap: () => onDestinationSelected(i),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AddButton extends StatelessWidget {
  final VoidCallback onPressed;

  const _AddButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: "Add review",
      button: true,
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onPressed,
        child: Container(
          width: 48,
          height: 48,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primary,
          ),
          child: Picon(PiconsRegular.plus, color: AppColors.onPrimary, size: 24),
        ),
      ),
    );
  }
}

class _NavBarTapTarget extends StatelessWidget {
  final NavBarItem item;
  final bool selected;
  final VoidCallback onTap;

  const _NavBarTapTarget({
    required this.item,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Color iconColor = selected
        ? AppColors.secondary
        : AppColors.onSurfaceMuted;

    return Semantics(
      label: item.label,
      selected: selected,
      button: true,
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: Container(
          width: 44,
          height: 44,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: selected
                ? AppColors.primaryLight.withValues(alpha: 0.25)
                : Colors.transparent,
          ),
          child: Picon(
            item.icon,
            color: iconColor,
            duoColor: selected ? AppColors.primary : iconColor,
            size: 24,
          ),
        ),
      ),
    );
  }
}
