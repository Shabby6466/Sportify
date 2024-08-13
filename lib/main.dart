import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportify/presentations/routes/routes.dart';
import 'package:sportify/services/di/getit.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      ensureScreenSize: true,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouting.router,
        theme: ThemeData(
            fontFamily: 'Gelion',
            textTheme: TextTheme(
                bodyLarge: TextStyle(
                  fontSize: 26.sp,
                  fontWeight: FontWeight.w500,
                ),
                bodyMedium:
                    TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w400),
                bodySmall:
                    TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w400),
                labelLarge:
                    TextStyle(fontSize: 19.sp, fontWeight: FontWeight.w500))),
      ),
    );
  }
}
