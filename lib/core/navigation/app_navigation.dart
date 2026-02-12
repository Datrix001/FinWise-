import 'dart:async';

import 'package:finwise2/core/di/di.dart';
import 'package:finwise2/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:finwise2/features/auth/presentation/cubit/auth_state.dart';
import 'package:finwise2/features/auth/presentation/screens/login_screen.dart';
import 'package:finwise2/features/auth/presentation/screens/signup_screen.dart';
import 'package:finwise2/features/home/presentation/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppNavigation {
  static final _routerNotifier = _AuthRouterNotifier(getIt<AuthCubit>());
  static final GoRouter route = GoRouter(
    initialLocation: LoginScreen.routeName,
    refreshListenable: _routerNotifier,
    routes: [
      GoRoute(
        path: LoginScreen.routeName,
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        path: SignUpScreen.routeName,
        builder: (context, state) => SignUpScreen(),
      ),
      GoRoute(path: Home.routeName, builder: (context, state) => Home()),
    ],
    redirect: (context, goState) {
      final authCubit = getIt<AuthCubit>();
      final state = authCubit.state;
      final isAuthenticated = state is AuthAuthenticated;

      final isGoingToLogin = goState.matchedLocation == LoginScreen.routeName;
      final isGoingToSignup = goState.matchedLocation == SignUpScreen.routeName;

      if (!isAuthenticated && !(isGoingToLogin || isGoingToSignup)) {
        return LoginScreen.routeName;
      }

      if (isAuthenticated && (isGoingToLogin || isGoingToSignup)) {
        return Home.routeName;
      }
      return null;
    },
  );
}

class _AuthRouterNotifier extends ChangeNotifier {
  _AuthRouterNotifier(AuthCubit cubit) {
    _sub = cubit.stream.listen((_) => notifyListeners());
  }

  late final StreamSubscription _sub;
}
