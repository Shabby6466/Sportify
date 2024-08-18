import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

import '../../../bloc/calendar/calendar_bloc.dart';

class DaysCounter extends StatelessWidget {
  const DaysCounter({super.key});

  @override
  Widget build(BuildContext context) {
    final screenUtil = GetIt.I<ScreenUtil>();
    return Padding(
      padding: EdgeInsets.all(screenUtil.radius(16)),
      child: Container(
        padding: EdgeInsets.all(screenUtil.radius(16)),
        height: screenUtil.setHeight(100),
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(screenUtil.radius(16)),
          color: Colors.blue.withOpacity(0.15),
        ),
        child: BlocBuilder<CalendarBloc, CalendarState>(
          builder: (context, state) {
            if (state is CalendarStateLoaded) {
              final tickedDates = state.tickedDates;
              return Row(
                children: [
                  Text(
                    "Number of Days",
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          fontSize: 18,
                          height: 20.sp / 18.sp,
                        ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  VerticalDivider(),
                  Spacer(),
                  Text(
                    tickedDates.length.toString(),
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Spacer(),
                ],
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
