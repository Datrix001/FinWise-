import 'package:finwise2/features/auth/data/datasources/auth_remote_datasources.dart';
import 'package:finwise2/features/auth/data/model/user_model.dart';
import 'package:finwise2/features/auth/data/repository/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDatasources remoteDatasources;

  AuthRepositoryImpl({required this.remoteDatasources});

  @override
  Future<void> signOut() async {
    await remoteDatasources.signOut();
  }

  @override
  Future<void> signInWithEmailAndPassWord(UserModel model) async {
    await remoteDatasources.signInWithEmailAndPassWord(model);
  }

  @override
  Future<void> signUpWithEmailAndPassword(UserModel model) async {
    await remoteDatasources.signUpWithEmailAndPassword(model);
  }
}
