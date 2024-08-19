import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sportify/presentations/pages/home/widgets/video_controller.dart';
import 'package:sportify/presentations/routes/navigation.dart';

final locator = GetIt.I;

void setupLocator() async {
  locator.registerSingleton<AppNavigation>(NavigationImpl());
  locator.registerSingleton<ScreenUtil>(ScreenUtil());
  locator.registerSingleton<VideoController>(VideoController());
  final sharedPrefs = await SharedPreferences.getInstance();
  locator.registerSingleton<SharedPreferences>(sharedPrefs);
}
