import "package:flutter/material.dart";
import "package:quilby/theme/theme.dart";
import "package:quilby/widgets/widgets.dart";

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        title: "quilby",
        titleStyle: AppTextStyles.title,
        leading: HeaderMenu(),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: HeaderNotifications(),
          ),
        ],
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Text("Welcome to Quilby!", style: AppTextStyles.body1),
      ),
    );
  }
}
