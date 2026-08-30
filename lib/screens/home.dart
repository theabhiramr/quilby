import "package:flutter/material.dart";
import "package:quilby/theme/theme.dart";
import "package:quilby/widgets/widgets.dart";

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          Header(
            title: "quilby",
            titleStyle: AppTextStyles.title(context),
            leading: HeaderMenu(),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: HeaderNotifications(),
              ),
            ],
            backgroundColor: Theme.of(context).colorScheme.surface,
          ),
          SliverList.builder(
            itemCount: 40,
            itemBuilder: (context, index) => ListTile(
              title: Text(
                "TEMP TEST ITEM $index",
                style: AppTextStyles.body1(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
