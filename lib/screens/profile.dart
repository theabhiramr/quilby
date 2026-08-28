import "package:flutter/material.dart";

import "package:quilby/services/services.dart";
import "package:quilby/theme/theme.dart";
import "package:quilby/widgets/widgets.dart";

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = AuthService().currentUser;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          Header(
            title: "Profile",
            centerTitle: false,
            actions: const [],
            backgroundColor: Colors.transparent,
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    children: [
                      QuilbyButton(
                        text: "Sign in/Sign up",
                        onPressed: () {
                          Navigator.pushNamed(context, "/auth");
                        },
                      ),
                      Text(
                        user?.email ?? "Not signed in",
                        style: AppTextStyles.body1,
                      ),
                    ],
                  ),
                  if (user != null) ...[
                    const SizedBox(height: 16),
                    TextButton(
                      onPressed: () => AuthService().signOut(),
                      child: Text("Sign out", style: AppTextStyles.body2),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
