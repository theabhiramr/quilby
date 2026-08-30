import "package:flutter/material.dart";

import "package:quilby/theme/theme.dart";
import "package:quilby/widgets/widgets.dart";

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          Header(
            title: "Your Library",
            centerTitle: false,
            actions: const [],
            backgroundColor: Colors.transparent,
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: Text(
                "Your library is empty",
                style: AppTextStyles.body1(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
