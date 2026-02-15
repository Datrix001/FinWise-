import 'package:finwise2/features/auth/data/model/user_model.dart';
import 'package:finwise2/features/auth/data/repository/auth_repository.dart';
import 'package:finwise2/features/auth/presentation/cubit/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide AuthState;

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository repository;

  AuthCubit({required this.repository}) : super(AuthInitialState()) {
    _listenToAuthChanges();
  }

  Future<void> signOut() async {
    emit(AuthLoadingState());
    try {
      await repository.signOut();
      emit(AuthUnAuthenticated());
    } catch (e) {
      emit(AuthFailureState(errorMessage: e.toString()));
    }
  }

  Future<void> signInWithEmailAndPassWord(UserModel model) async {
    emit(AuthLoadingState());
    try {
      await repository.signInWithEmailAndPassWord(model);
    } catch (e) {
      emit(AuthFailureState(errorMessage: e.toString()));
    }
  }

  Future<void> signUpWithEmailAndPassword(UserModel model) async {
    emit(AuthLoadingState());
    try {
      await repository.signUpWithEmailAndPassword(model);
    } catch (e) {
      emit(AuthFailureState(errorMessage: e.toString()));
    }
  }

  void _listenToAuthChanges() {
    final supabase = Supabase.instance.client;

    final session = supabase.auth.currentSession;

    if (session != null) {
      emit(AuthAuthenticated());
    } else {
      emit(AuthUnAuthenticated());
    }

    supabase.auth.onAuthStateChange.listen((data) {
      final session = data.session;

      if (session != null) {
        emit(AuthAuthenticated());
      } else {
        emit(AuthUnAuthenticated());
      }
    });
  }

  Future<void> signInWithGoogle() async {
    try {
      await repository.signInWithGoogle();
    } catch (e) {
      emit(AuthFailureState(errorMessage: e.toString()));
    }
  }
}
