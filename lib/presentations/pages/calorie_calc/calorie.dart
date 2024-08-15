import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:sportify/presentations/bloc/calorie/calorie_bloc.dart';
import 'package:sportify/presentations/pages/themes/my_colors.dart';
import 'package:sportify/widgets/main_scaffold.dart';

class MealCalc extends StatelessWidget {
  const MealCalc({super.key});

  @override
  Widget build(BuildContext context) {
    final screenUtil = GetIt.I<ScreenUtil>();
    return MainScaffold(
      myAppBar: AppBar(
        toolbarHeight: 80,
        title: Text(
          "Calorie Calculator",
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                fontSize: screenUtil.setSp(24),
                fontWeight: FontWeight.bold,
              ),
        ),
        actions: [
          Icon(CupertinoIcons.checkmark_alt_circle_fill,
              size: screenUtil.setHeight(25)),
          SizedBox(
            width: screenUtil.setWidth(30),
          ),
        ],
        backgroundColor: MyColors.bgWhite,
      ),
      bodyContainer: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(
                screenUtil.setSp(0), 80, screenUtil.setSp(0), 0),
            child: const Divider(),
          ),
          SizedBox(
            height: screenUtil.setHeight(20),
          ),
          BlocBuilder<CalorieBloc, CalorieState>(builder: (context, state) {
            print(state.age.toString());
            return Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(label: Text("Age")),
                  keyboardType: TextInputType.number,
                  onChanged: (val) => context
                      .read<CalorieBloc>()
                      .add(AgeChanged(int.parse(val))),
                ),
                Text(state.age.toString()),
                // This will update when the state changes
              ],
            );
          })
        ],
      ),
    );
  }
}
