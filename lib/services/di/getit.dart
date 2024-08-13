import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:sportify/presentations/routes/navigation.dart';

final locator = GetIt.I;

void setupLocator() {
  locator.registerSingleton<AppNavigation>(NavigationImpl());
  locator.registerSingleton<ScreenUtil>(ScreenUtil());
}
