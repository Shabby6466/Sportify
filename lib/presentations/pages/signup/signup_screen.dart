import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:sportify/presentations/bloc/singup/signup_bloc.dart';
import 'package:sportify/presentations/pages/login/widgets/login_text.dart';
import 'package:sportify/presentations/pages/login/widgets/logo.dart';
import 'package:sportify/presentations/pages/themes/my_colors.dart';
import 'package:sportify/presentations/routes/navigation.dart';
import 'package:sportify/presentations/routes/navigation_strings.dart';
import 'package:sportify/services/di/getit.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController loginController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController usernameController = TextEditingController();
    final navigation = locator<AppNavigation>();
    final screenUtil = GetIt.I<ScreenUtil>();
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: MyColors.bgWhite,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              screenUtil.setSp(32), 20, screenUtil.setSp(32), 0),
          child: Column(
            children: [
              const Logo(),
              SizedBox(
                height: screenUtil.setHeight(40),
              ),
              Text(
                "Register with ChalPro",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    height: screenUtil.setSp(27) / screenUtil.setSp(26),
                    letterSpacing: screenUtil.setSp(0),
                    color: MyColors.primaryBlack),
              ),
              SizedBox(
                height: screenUtil.setSp(20),
              ),
              LoginTextField(
                  controller: loginController,
                  label: "Email",
                  hint: "Enter Email/Phone Number"),
              SizedBox(
                height: screenUtil.setSp(20),
              ),
              LoginTextField(
                  controller: usernameController,
                  label: "Username",
                  hint: "Enter UserName"),
              SizedBox(
                height: screenUtil.setSp(20),
              ),
              LoginTextField(
                  obscuretext: true,
                  controller: passwordController,
                  label: "Password",
                  hint: "Password"),
              SizedBox(
                height: screenUtil.setSp(20),
              ),
              GestureDetector(
                onTap: () {
                  context.read<SignupBloc>().add(SignupSubmitted(
                      loginController.text,
                      usernameController.text,
                      passwordController.text));
                },
                child: Container(
                  height: screenUtil.setHeight(50),
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
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                child: Row(
                  children: [
                    Text(
                      "Already Registered",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: MyColors.primaryBlack,
                          decoration: TextDecoration.underline),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        navigation.popBack(context);
                      },
                      child: Text(
                        "Login Back",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: MyColors.primaryBlack,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ],
                ),
              ),
              BlocConsumer<SignupBloc, SignupState>(builder: (context, state) {
                if (state is SignupLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return const SizedBox.shrink();
              }, listener: (context, state) {
                if (state is SignupSucces) {
                  navigation.go(context, NavigationStrings.bottomBar);
                } else if (state is SignupFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.error)),
                  );
                  print(state.error);
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}
