import 'package:picons/picons.dart';

import 'package:flutter/material.dart';

import 'package:quilby/widgets/widgets.dart';
import 'package:quilby/theme/theme.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 48, bottom: 32),
                      child: Column(
                        children: [
                          Image.asset(
                            isDarkMode
                                ? "assets/images/quilby_logo_dark.png"
                                : "assets/images/quilby_logo.png",
                            width: 180,
                            height: 180,
                          ),
                          const SizedBox(height: 8),
                          Text("quilby", style: AppTextStyles.title(context)),
                        ],
                      ),
                    ),
                    Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 400),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Column(
                            children: [
                              AuthInput(
                                icon: Picons.user,
                                label: "Email",
                                controller: TextEditingController(),
                              ),
                              const SizedBox(height: 20),
                              AuthInput(
                                icon: Picons.lock,
                                label: "Password",
                                obscureText: true,
                                controller: TextEditingController(),
                              ),
                              const SizedBox(height: 28),
                              QuilbyButton(
                                text: "Sign In",
                                onPressed: () {
                                  // Handle sign-in logic here
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
