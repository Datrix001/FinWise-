import 'package:finwise2/features/profile/data/model/profile_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileRemoteDatasources {
  final SupabaseClient client;

  ProfileRemoteDatasources({required this.client});

  Future<ProfileModel> getUserData() async {
    final user = client.auth.currentUser;

    if (user == null) {
      throw Exception("User not logged in");
    }
    return ProfileModel(
      id: user.id,
      name:
          user.userMetadata?['fullName'] ??
          user.userMetadata?['full_name'] ??
          '',
      email: user.email ?? '',
    );
  }
}
