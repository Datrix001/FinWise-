import 'package:finwise2/features/auth/presentation/screens/login_screen.dart';
import 'package:finwise2/features/auth/presentation/screens/signup_screen.dart';
import 'package:go_router/go_router.dart';

class AppNavigation {
  static final GoRouter route = GoRouter(
    initialLocation: LoginScreen.routeName,
    routes: [
      GoRoute(
        path: LoginScreen.routeName,
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        path: SignUpScreen.routeName,
        builder: (context, state) => SignUpScreen(),
      ),
    ],
  );
}
