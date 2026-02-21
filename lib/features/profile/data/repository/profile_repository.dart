import 'package:finwise2/features/profile/data/model/profile_model.dart';

abstract class ProfileRepository {
  Future<ProfileModel> getUserData();
}
