import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  final SupabaseClient _client;

  SupabaseService(this._client);

  Future<void> signUp(String email, String password) async {
    final response = await _client.auth.signUp(
      email: email,
      password: password,
    );
    if (response.error != null) {
      throw Exception(response.error!.message);
    }
  }

  Future<void> signIn(String email, String password) async {
    final response = await _client.auth.signIn(
      email: email,
      password: password,
    );
    if (response.error != null) {
      throw Exception(response.error!.message);
    }
  }

  Future<void> signOut() async {
    final response = await _client.auth.signOut();
    if (response.error != null) {
      throw Exception(response.error!.message);
    }
  }
}
