import 'package:flutter/material.dart';

import 'package:quilby/theme/theme.dart';
import 'package:quilby/widgets/widgets.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        title: "Login",
        centerTitle: false,
        actions: const [],
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AuthInput(
              label: "Email",
              hintText: "Enter your email",
              controller: TextEditingController(),
            ),
            const SizedBox(height: 16),
            AuthInput(
              label: "Password",
              hintText: "Enter your password",
              obscureText: true,
              controller: TextEditingController(),
            ),
          ],
        ),
      ),
    );
  }
}
