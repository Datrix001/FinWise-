import 'package:finwise2/features/profile/data/datasources/profile_remote_datasources.dart';
import 'package:finwise2/features/profile/data/model/profile_model.dart';
import 'package:finwise2/features/profile/data/repository/profile_repository.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  final ProfileRemoteDatasources remoteDatasources;

  ProfileRepositoryImpl({required this.remoteDatasources});

  @override
  Future<ProfileModel> getUserData() async {
    return await remoteDatasources.getUserData();
  }
}
