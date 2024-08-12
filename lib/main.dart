import 'package:flutter/material.dart';
import 'package:sportify/models/getit.dart';
import 'package:sportify/presentations/routes/routes.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouting.router,
      theme: ThemeData(
          fontFamily: 'Gelion',
          textTheme: const TextTheme(
              bodyLarge: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w500,
              ),
              bodyMedium: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
              bodySmall: TextStyle(fontSize: 11, fontWeight: FontWeight.w400),
              labelLarge:
                  TextStyle(fontSize: 19, fontWeight: FontWeight.w500))),
    );
  }
}
