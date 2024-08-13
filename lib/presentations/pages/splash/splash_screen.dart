import 'package:flutter/material.dart';
import 'package:sportify/presentations/pages/login/widgets/logo.dart';
import 'package:sportify/presentations/pages/themes/my_colors.dart';
import 'package:sportify/presentations/routes/navigation.dart';
import 'package:sportify/presentations/routes/navigation_strings.dart';
import 'package:sportify/services/di/getit.dart';
import 'package:sportify/widgets/main_scaffold.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

final navigation = locator<AppNavigation>();

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then((val) {
      navigation.goNamed(context, NavigationStrings.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const MainScaffold(
        bodyContainer:  Center(child: Logo()));
  }
}
