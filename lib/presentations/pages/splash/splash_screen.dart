import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      navigation.goNamed(context, NavigationStrings.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
        bodyContainer: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        SizedBox(
          width: MediaQuery.sizeOf(context).width,
          height: 300.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Chal",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 57.sp,
                    fontWeight: FontWeight.bold,
                    color: MyColors.primaryBlack),
              ),
              SizedBox(width: 2.w),
              Align(
                  alignment: const Alignment(0, 0.05),
                  child: Text(
                    "Pro",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 57.sp,
                        fontWeight: FontWeight.bold,
                        color: MyColors.buttonPrimary),
                  ))
            ],
          ),
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Stay Fit ",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w400,
                  color: MyColors.primaryBlack),
            ),
            SizedBox(width: 2.w),
            Text(
              "&",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: 40.sp,
                  fontWeight: FontWeight.bold,
                  color: MyColors.buttonPrimary),
            ),
            Text(
              " Focused",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w400,
                  color: MyColors.buttonPrimary),
            )
          ],
        ),
        SizedBox(
          height: 20.h,
        )
      ],
    ));
  }
}
