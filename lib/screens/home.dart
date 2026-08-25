import "package:flutter/material.dart";
import "package:quilby/widgets/widgets.dart";

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(
        title: "quilby",
        actions: [NotificationsAction()],
        backgroundColor: Colors.transparent,
      ),
      body: const Center(child: Text("Welcome to Quilby!")),
    );
  }
}
