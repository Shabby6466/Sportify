import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:sportify/presentations/bloc/calorie/calorie_bloc.dart';
import 'package:sportify/presentations/pages/themes/my_colors.dart';

class ResultContainer extends StatelessWidget {
  const ResultContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final screenUtil = GetIt.I<ScreenUtil>();

    return BlocBuilder<CalorieBloc, CalorieState>(
      builder: (context, state) {
        final visible = state.visible;
        final calories = state.calories;

        return Container(
          width: MediaQuery.sizeOf(context).width,
          height: screenUtil.setHeight(200),
          decoration: BoxDecoration(
            color: MyColors.buttonPrimary.withOpacity(0.14),
            borderRadius: BorderRadius.circular(screenUtil.radius(10)),
          ),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Text(
                "Result",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
              Visibility(
                visible: visible,
                child: Text(
                  calories != 0
                      ? "You will have to maintain ${calories.round()} calories"
                      : "",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: screenUtil.setSp(18.5),
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
