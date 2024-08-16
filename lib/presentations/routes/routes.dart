import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sportify/presentations/pages/home/home_screen.dart';
import 'package:sportify/presentations/pages/login/login_screen.dart';
import 'package:sportify/presentations/pages/calorie_calc/calorie.dart';
import 'package:sportify/presentations/pages/splash/splash_screen.dart';
import 'package:sportify/presentations/routes/navigation_strings.dart';
import 'package:sportify/widgets/bottom_bar.dart';

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
        }),
    GoRoute(
        path: NavigationStrings.mealCalc,
        name: NavigationStrings.mealCalc,
        builder: (BuildContext context, GoRouterState state) {
          return const CalorieCalculator();
        }),
    GoRoute(
        path: NavigationStrings.bottomBar,
        name: NavigationStrings.bottomBar,
        builder: (BuildContext context, GoRouterState state) {
          return const MyBottomBar();
        }),

  ]);
}
