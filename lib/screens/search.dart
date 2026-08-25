import "package:flutter/material.dart";

import "package:quilby/theme/theme.dart";
import "package:quilby/widgets/widgets.dart";

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        title: "Search",
        centerTitle: false,
        actions: const [],
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Text("Search coming soon", style: AppTextStyles.body1),
      ),
    );
  }
}
