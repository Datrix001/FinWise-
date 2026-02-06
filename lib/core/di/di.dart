import 'package:finwise2/features/auth/data/datasources/auth_remote_datasources.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final getIt = GetIt.instance;

Future<void> loadDependencies() async {
  getIt.registerLazySingleton<SupabaseClient>(() => Supabase.instance.client);

  getIt.registerLazySingleton<AuthRemoteDatasources>(
    () => AuthRemoteDatasources(client: getIt<SupabaseClient>()),
  );
}
