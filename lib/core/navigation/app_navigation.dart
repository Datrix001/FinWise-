import 'dart:async';

import 'package:finwise2/core/di/di.dart';
import 'package:finwise2/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:finwise2/features/auth/presentation/cubit/auth_state.dart';
import 'package:finwise2/features/auth/presentation/screens/login_screen.dart';
import 'package:finwise2/features/auth/presentation/screens/signup_screen.dart';
import 'package:finwise2/features/expense/presentation/screens/add_expense.dart';
import 'package:finwise2/features/expense/presentation/screens/expenses_screen.dart';
import 'package:finwise2/features/friend/presentation/screens/friend_screen.dart';
import 'package:finwise2/features/group/presentation/screens/add_group.dart';
import 'package:finwise2/features/group/presentation/screens/group_screen.dart';
import 'package:finwise2/features/home/presentation/screens/home.dart';
import 'package:finwise2/features/home/presentation/screens/home_screen.dart';
import 'package:finwise2/features/profile/presentation/screens/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppNavigation {
  static final _routerNotifier = _AuthRouterNotifier(getIt<AuthCubit>());
  static final GoRouter route = GoRouter(
    debugLogDiagnostics: true,
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
      GoRoute(
        path: FriendScreen.routeName,
        builder: (context, state) => FriendScreen(),
      ),
      GoRoute(
        path: GroupScreen.routeName,
        builder: (context, state) => GroupScreen(),
      ),
      GoRoute(
        path: SettingScreen.routeName,
        builder: (context, state) => SettingScreen(),
      ),
      GoRoute(
        path: HomeScreen.routeName,
        builder: (context, state) => HomeScreen(),
      ),
      GoRoute(
        path: AddExpense.routeName,
        builder: (context, state) => AddExpense(),
      ),
      GoRoute(
        path: AddGroup.routeName,
        builder: (context, state) => AddGroup(),
      ),
      GoRoute(
        path: ExpensesScreen.routeName,
        builder: (context, state) => ExpensesScreen(),
      ),
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
