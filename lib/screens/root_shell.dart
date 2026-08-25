import "package:flutter/material.dart";
import "package:picons/picons.dart";

import "package:quilby/screens/screens.dart";
import "package:quilby/theme/theme.dart";
import "package:quilby/widgets/widgets.dart";

class RootShell extends StatefulWidget {
  const RootShell({super.key});

  @override
  State<RootShell> createState() => _RootShellState();
}

class _RootShellState extends State<RootShell> {
  int _selectedIndex = 0;

  static const List<Widget> _screens = [
    Home(),
    SearchScreen(),
    LibraryScreen(),
    ProfileScreen(),
  ];

  static final List<NavigationDestination> _destinations = [
    _destination(icon: PiconsDuotone.house, label: "Home"),
    _destination(icon: PiconsDuotone.magnifyingGlass, label: "Search"),
    _destination(icon: PiconsDuotone.books, label: "Library"),
    _destination(icon: PiconsDuotone.userCircle, label: "Profile"),
  ];

  static NavigationDestination _destination({
    required PiconDuotoneData icon,
    required String label,
  }) {
    return NavigationDestination(
      icon: Picon(
        icon,
        color: AppColors.onSurfaceMuted,
        duoColor: AppColors.onSurfaceMuted,
        size: 24,
      ),
      selectedIcon: Picon(
        icon,
        color: AppColors.secondary,
        duoColor: AppColors.primary,
        size: 24,
      ),
      label: label,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _screens),
      bottomNavigationBar: AppBottomNavBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) => setState(() => _selectedIndex = index),
        destinations: _destinations,
      ),
    );
  }
}
