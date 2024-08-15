import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sportify/presentations/pages/home/home_screen.dart';
import 'package:sportify/presentations/pages/login/login_screen.dart';
import 'package:sportify/presentations/pages/splash/splash_screen.dart';
import 'package:sportify/presentations/routes/navigation_strings.dart';

class AppRouting {
  static GoRouter router = GoRouter(initialLocation: '/', routes: <RouteBase>[
    GoRoute(
        path: NavigationStrings.splash,
        name: NavigationStrings.splash,
        builder: (BuildContext context, GoRouterState state) {
          return const SplashScreen();
        }),
    GoRoute(
        path: NavigationStrings.login,
        name: NavigationStrings.login,
        builder: (BuildContext context, GoRouterState state) {
          return const LoginScreen();
        }),
    GoRoute(
        path: NavigationStrings.home,
        name: NavigationStrings.home,
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
        })
  ]);
}
