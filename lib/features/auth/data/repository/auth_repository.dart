import 'package:finwise2/features/auth/data/model/user_model.dart';

abstract class AuthRepository {
  Future<void> signOut();
  Future<void> signInWithEmailAndPassWord(UserModel model);
  Future<void> signUpWithEmailAndPassword(UserModel model);
  Future<void> signInWithGoogle();
}
