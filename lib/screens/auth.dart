import 'package:flutter/material.dart';

import 'package:quilby/theme/theme.dart';
import 'package:quilby/widgets/widgets.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 40),
                      child: Text(
                        "quilby",
                        style: AppTextStyles.title(context).copyWith(
                          fontSize: 48,
                          letterSpacing: 1.2,
                        ),
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
                                label: "Email",
                                hintText: "Enter your email",
                                controller: TextEditingController(),
                              ),
                              const SizedBox(height: 20),
                              AuthInput(
                                label: "Password",
                                hintText: "Enter your password",
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
