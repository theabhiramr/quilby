import "package:flutter/material.dart";

import "package:quilby/theme/theme.dart";
import "package:quilby/widgets/widgets.dart";

class AddReviewScreen extends StatelessWidget {
  const AddReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        title: "Add Review",
        centerTitle: false,
        actions: const [],
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Text("Book review form coming soon", style: AppTextStyles.body1),
      ),
    );
  }
}
