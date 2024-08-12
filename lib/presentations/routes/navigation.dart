import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

abstract class AppNavigation {
  void goNamed(BuildContext context, String route);

  void popBack(BuildContext context);
}

class NavigationImpl extends AppNavigation {
  @override
  void goNamed(BuildContext context, String route) {
    context.goNamed(route);
  }

  @override
  void popBack(BuildContext context) {
    context.pop();
  }
}
