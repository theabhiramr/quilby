import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:quilby/screens/screens.dart';
import 'package:quilby/services/services.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = AuthService();

    return StreamBuilder<AuthState>(
      stream: authService.authStateChanges,
      builder: (context, snapshot) {
        final user = snapshot.data?.session?.user ?? authService.currentUser;
        return user == null ? const AuthScreen() : const RootShell();
      },
    );
  }
}
