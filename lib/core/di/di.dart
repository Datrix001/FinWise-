import 'package:finwise2/features/auth/data/datasources/auth_remote_datasources.dart';
import 'package:finwise2/features/auth/data/repository/auth_repository.dart';
import 'package:finwise2/features/auth/data/repository/auth_repository_impl.dart';
import 'package:finwise2/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:finwise2/features/profile/data/datasources/profile_remote_datasources.dart';
import 'package:finwise2/features/profile/data/repository/profile_repository.dart';
import 'package:finwise2/features/profile/data/repository/profile_repository_impl.dart';
import 'package:finwise2/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final getIt = GetIt.instance;

Future<void> loadDependencies() async {
  getIt.registerLazySingleton<SupabaseClient>(() => Supabase.instance.client);

  getIt.registerLazySingleton<AuthRemoteDatasources>(
    () => AuthRemoteDatasources(client: getIt<SupabaseClient>()),
  );
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(remoteDatasources: getIt<AuthRemoteDatasources>()),
  );
  getIt.registerFactory<AuthCubit>(
    () => AuthCubit(repository: getIt<AuthRepository>()),
  );

  getIt.registerLazySingleton<ProfileRemoteDatasources>(
    () => ProfileRemoteDatasources(client: getIt<SupabaseClient>()),
  );

  getIt.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(
      remoteDatasources: getIt<ProfileRemoteDatasources>(),
    ),
  );

  getIt.registerFactory<ProfileCubit>(
    () => ProfileCubit(repository: getIt<ProfileRepository>()),
  );
}
