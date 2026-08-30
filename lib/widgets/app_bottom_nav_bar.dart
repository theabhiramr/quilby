import 'package:flutter/material.dart';
import 'package:picons/picons.dart';

import 'package:quilby/theme/colors.dart';

const double _outerMargin = 16;
const double _barHeight = 64;
const double _barHorizontalPadding = 20;
const double _itemSpacing = 14;
const double _barElevation = 8;
const double _addButtonSize = 48;
const double _navItemSize = 44;
const double _iconSize = 24;
const double _selectedIndicatorOpacity = 0.25;

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
      padding: EdgeInsets.fromLTRB(
        _outerMargin,
        0,
        _outerMargin,
        bottomInset + _outerMargin,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Material(
            color: Theme.of(context).colorScheme.surface,
            shadowColor: AppColors.shadow,
            elevation: _barElevation,
            shape: const StadiumBorder(),
            clipBehavior: Clip.antiAlias,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: _barHorizontalPadding,
              ),
              child: SizedBox(
                height: _barHeight,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (int i = 0; i < items.length; i++) ...[
                      if (i == centerIndex) ...[
                        const SizedBox(width: _itemSpacing),
                        _AddButton(onPressed: onAddPressed),
                        const SizedBox(width: _itemSpacing),
                      ] else if (i > 0)
                        const SizedBox(width: _itemSpacing),
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
          width: _addButtonSize,
          height: _addButtonSize,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primary,
          ),
          child: Picon(
            PiconsRegular.plus,
            color: AppColors.onPrimary,
            size: _iconSize,
          ),
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
          width: _navItemSize,
          height: _navItemSize,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: selected
                ? AppColors.primaryLight.withValues(
                    alpha: _selectedIndicatorOpacity,
                  )
                : Colors.transparent,
          ),
          child: Picon(
            item.icon,
            color: iconColor,
            duoColor: selected ? AppColors.primary : iconColor,
            size: _iconSize,
          ),
        ),
      ),
    );
  }
}
