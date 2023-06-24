import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:schatty/features/auth/presentation/screens/login_page.dart';
import 'package:schatty/features/auth/providers.dart';
import 'package:schatty/features/homepage/presentation/screens/homepage.dart';

final _key = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authProvider);

  return GoRouter(
      navigatorKey: _key,
      debugLogDiagnostics: true,
      initialLocation: HomePage.routeLocation,
      routes: [
        GoRoute(
          path: HomePage.routeLocation,
          name: HomePage.routeName,
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: LoginPage.routeLocation,
          name: LoginPage.routeName,
          builder: (context, state) => const LoginPage(),
        ),
      ],
      redirect: (context, state) {
        if (authState.isLoading || authState.hasError) return null;
        final isAuth = authState.valueOrNull != null;

        if (state.location == LoginPage.routeLocation) {
          return isAuth ? HomePage.routeLocation : null;
        }
        return isAuth ? null : LoginPage.routeLocation;
      });
});
