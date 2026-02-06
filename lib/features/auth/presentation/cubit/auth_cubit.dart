import 'package:finwise2/features/auth/data/model/user_model.dart';
import 'package:finwise2/features/auth/data/repository/auth_repository.dart';
import 'package:finwise2/features/auth/presentation/cubit/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository repository;

  AuthCubit({required this.repository}) : super(AuthInitialState());

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
      emit(AuthAuthenticated());
    } catch (e) {
      emit(AuthFailureState(errorMessage: e.toString()));
    }
  }

  Future<void> signUpWithEmailAndPassword(UserModel model) async {
    emit(AuthLoadingState());
    try {
      await repository.signUpWithEmailAndPassword(model);
      emit(AuthAuthenticated());
    } catch (e) {
      emit(AuthFailureState(errorMessage: e.toString()));
    }
  }
}
