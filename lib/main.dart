import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportify/presentations/bloc/calendar/calendar_bloc.dart';
import 'package:sportify/presentations/bloc/calorie/calorie_bloc.dart';
import 'package:sportify/presentations/bloc/login/login_bloc.dart';
import 'package:sportify/presentations/bloc/singup/signup_bloc.dart';
import 'package:sportify/presentations/routes/routes.dart';
import 'package:sportify/services/di/getit.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      ensureScreenSize: true,
      minTextAdapt: true,
      useInheritedMediaQuery: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (BuildContext context) => CalorieBloc()),
          BlocProvider(create: (BuildContext context) => CalendarBloc()),
          BlocProvider(create: (BuildContext context) => SignupBloc()),
          BlocProvider(create: (BuildContext context) => LoginBloc()),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouting.router,
          theme: ThemeData(
              fontFamily: 'Gelion',
              textTheme: const TextTheme(
                  bodyLarge: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w500,
                  ),
                  bodyMedium:
                      TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                  bodySmall:
                      TextStyle(fontSize: 11, fontWeight: FontWeight.w400),
                  labelLarge:
                      TextStyle(fontSize: 19, fontWeight: FontWeight.w500))),
        ),
      ),
    );
  }
}
