import 'dart:io';

import 'package:finwise2/features/auth/data/model/user_model.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';
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

  Future<void> signInUsingGoogle() async {
    try {
      final googleSignIn = GoogleSignIn.instance;

      await googleSignIn.initialize(
        clientId: Platform.isAndroid
            ? dotenv.env['ANDROID_CLIENT_ID']
            : dotenv.env['IOS_CLIENT_ID'],
        serverClientId: dotenv.env['WEB_CLIENT_ID'],
      );

      final googleUser = await googleSignIn.authenticate();

      final googleAuth = googleUser.authentication;

      await client.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: googleAuth.idToken!,
      );
    } on PlatformException catch (e) {
      throw Exception('Google Sign-In failed: ${e.message}');
    } catch (e) {
      throw Exception('Google Sign-In failed: $e');
    }
  }
}
