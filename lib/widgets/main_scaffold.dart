import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:sportify/presentations/pages/splash/splash_screen.dart';
import 'package:sportify/presentations/pages/themes/my_colors.dart';
import 'package:sportify/presentations/routes/navigation_strings.dart';

class MainScaffold extends StatelessWidget {
  final myAppBar;
  final bodyContainer;
  final title;

  const MainScaffold({super.key, this.myAppBar, this.bodyContainer, this.title});

  @override
  Widget build(BuildContext context) {
    final screenUtil = GetIt.I<ScreenUtil>();
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: MyColors.bgWhite,
      appBar:AppBar(
        surfaceTintColor: MyColors.bgWhite,
        toolbarHeight: 80,
        title: Text(
          title,
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
            fontSize: screenUtil.setSp(24),
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          const Text("Sign Out"),
          GestureDetector(
            onTap: (){
              navigation.go(context, NavigationStrings.login);
            },
            child: Icon(CupertinoIcons.decrease_quotelevel,
                size: screenUtil.setHeight(25)),
          ),
          SizedBox(
            width: screenUtil.setWidth(30),
          ),
        ],
        backgroundColor: MyColors.bgWhite,
      ),
      body: SingleChildScrollView(child: bodyContainer),
    );
  }
}
