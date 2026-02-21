import 'package:finwise2/core/di/di.dart';
import 'package:finwise2/core/navigation/app_navigation.dart';
import 'package:finwise2/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:finwise2/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  loadDependencies();
  await dotenv.load(fileName: '.env');
  await Supabase.initialize(
    url: "${dotenv.env['SUPABASE_URL']}",
    anonKey: "${dotenv.env['SUPABASE_ANNO_KEY']}",
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),

      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<AuthCubit>.value(value: getIt<AuthCubit>()),
            BlocProvider<ProfileCubit>.value(value: getIt<ProfileCubit>()),
          ],
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: AppNavigation.route,
          ),
        );
      },
    );
  }
}
