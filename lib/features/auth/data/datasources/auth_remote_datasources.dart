import 'package:finwise2/features/auth/data/model/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRemoteDatasources {
  final SupabaseClient client;

  AuthRemoteDatasources({required this.client});

  Future<void> signInWithEmailAndPassWord(UserModel model) async {
    try {
      await client.auth.signInWithPassword(
        password: model.password,
        email: model.email,
      );
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> signUpWithEmailAndPassword(UserModel model) async {
    try {
      await client.auth.signUp(
        password: model.password,
        email: model.email,
        data: {'fullName': model.fullName},
      );
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> signOut() async {
    try {
      await client.auth.signOut();
    } catch (e) {
      throw e.toString();
    }
  }
}
