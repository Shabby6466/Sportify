import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:sportify/presentations/pages/login/widgets/login_text.dart';
import 'package:sportify/presentations/pages/login/widgets/logo.dart';
import 'package:sportify/presentations/pages/themes/image_const.dart';
import 'package:sportify/presentations/pages/themes/my_colors.dart';
import 'package:sportify/presentations/routes/navigation.dart';
import 'package:sportify/presentations/routes/navigation_strings.dart';
import 'package:sportify/services/di/getit.dart';
import 'package:sportify/widgets/main_scaffold.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final navigation = locator<AppNavigation>();
    final screenUtil = GetIt.I<ScreenUtil>();
    return MainScaffold(
        myAppBar: AppBar(
          elevation: 0.0,
          backgroundColor: MyColors.bgWhite,
          surfaceTintColor: MyColors.bgWhite,
        ),
        bodyContainer: Padding(
          padding: EdgeInsets.fromLTRB(screenUtil.setSp(32),
              1.8 * kToolbarHeight, screenUtil.setSp(32), 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Logo(),
              SizedBox(
                height: screenUtil.setHeight(60),
              ),
              Text(
                "Login to ChalPro",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    height: screenUtil.setSp(27) / screenUtil.setSp(26),
                    letterSpacing: screenUtil.setSp(0),
                    color: MyColors.primaryBlack),
              ),
              SizedBox(
                height: screenUtil.setSp(10),
              ),
              Text(
                "Log in to ChalPro to track your progress and crush your fitness goals!",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    height: screenUtil.setSp(27) / screenUtil.setSp(26),
                    letterSpacing: screenUtil.setSp(0),
                    color: MyColors.secondaryBlack),
              ),
              SizedBox(
                height: screenUtil.setSp(40),
              ),
              const LoginTextField(
                label: "Email",
                hint: "youremail@gmail.com",
              ),
              SizedBox(
                height: screenUtil.setHeight(20),
              ),
              const LoginTextField(
                label: 'password',
                hint: 'enter your password',
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                child: Text(
                  "Forgot Password?",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: MyColors.primaryBlack,
                      decoration: TextDecoration.underline),
                ),
              ),
              GestureDetector(
                onTap: () {
                  navigation.goNamed(context, NavigationStrings.home);
                },
                child: Container(
                  height: screenUtil.setHeight(42),
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(screenUtil.radius(4)),
                      gradient: const LinearGradient(
                          colors: [
                            MyColors.buttonPrimary,
                            MyColors.buttonSecondary
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter)),
                  child: Center(
                    child: Text(
                      "Login",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: MyColors.bgWhite,
                          ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: screenUtil.setHeight(30),
              ),
              Row(
                children: <Widget>[
                  const Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.only(
                        left: screenUtil.setWidth(10),
                        right: screenUtil.setWidth(10)),
                    child: Text(
                      "or",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: MyColors.secondaryBlack.withOpacity(0.5),
                          fontSize: screenUtil.setSp(14)),
                    ),
                  ),
                  const Expanded(child: Divider()),
                ],
              ),
              SizedBox(
                height: screenUtil.setHeight(25),
              ),
              Container(
                height: screenUtil.setHeight(50),
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  border: Border.all(color: MyColors.secondaryBlack),
                  borderRadius: BorderRadius.circular(screenUtil.radius(8)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(ImageConstants.google),
                    SizedBox(
                      width: screenUtil.setWidth(8),
                    ),
                    Text(
                      "Continue with Google",
                      style: Theme.of(context).textTheme.bodyMedium,
                    )
                  ],
                ),
              ),
              SizedBox(height: screenUtil.setHeight(12)),
              Container(
                height: screenUtil.setHeight(50),
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  border: Border.all(color: MyColors.secondaryBlack),
                  borderRadius: BorderRadius.circular(screenUtil.radius(4)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(ImageConstants.facebook),
                    SizedBox(
                      width: screenUtil.setWidth(10),
                    ),
                    Text(
                      "Continue with Facebook",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: screenUtil.setHeight(70),
              ),
              Center(
                child: Text.rich(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    TextSpan(
                        text: "By joining you agree to ChalPro",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: MyColors.primaryBlack.withOpacity(0.5),
                            height: screenUtil.setHeight(15.5) /
                                screenUtil.setHeight(15.5),
                            fontSize: screenUtil.setHeight(15.5),
                            letterSpacing: -0.5),
                        children: <TextSpan>[
                          TextSpan(
                            text: " Terms & Conditions",
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(
                                    color: MyColors.buttonPrimary,
                                    fontSize: screenUtil.setHeight(15.5),
                                    height: screenUtil.setHeight(15.5) /
                                        screenUtil.setHeight(15.5),
                                    letterSpacing: -0.5.sp),
                          ),
                        ])),
              ),
              SizedBox(
                height: screenUtil.setHeight(20),
              ),
            ],
          ),
        ));
  }
}
