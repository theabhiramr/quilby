import "package:flutter/material.dart";
import "package:picons/picons.dart";

import "package:quilby/screens/screens.dart";
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
    AuthScreen(),
  ];

  static const List<NavBarItem> _items = [
    NavBarItem(icon: PiconsDuotone.house, label: "Home"),
    NavBarItem(icon: PiconsDuotone.magnifyingGlass, label: "Search"),
    NavBarItem(icon: PiconsDuotone.books, label: "Library"),
    NavBarItem(icon: PiconsDuotone.userCircle, label: "Profile"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _screens),
      bottomNavigationBar: AppBottomNavBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) =>
            setState(() => _selectedIndex = index),
        items: _items,
        onAddPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            fullscreenDialog: true,
            builder: (_) => const AddReviewScreen(),
          ),
        ),
      ),
    );
  }
}
