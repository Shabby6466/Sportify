import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:sportify/presentations/bloc/calendar/calendar_bloc.dart';

class BuildContainerHeader extends StatelessWidget {
  const BuildContainerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final screenUtil = GetIt.I<ScreenUtil>();
    return Row(
      children: [
        BlocBuilder<CalendarBloc, CalendarState>(
          builder: (context, state) {
            if (state is CalendarStateLoaded){
              final currentMonth = state.days.first.month;
              final currentYear = state.days.first.year;
              return Text(
                DateFormat.MMMM().format(DateTime(currentYear,currentMonth)),
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontSize: screenUtil.setSp(30),
                fontWeight: FontWeight.bold,
              ),
              );
            }
            return Text(
              DateFormat.MMMM().format(DateTime.now()),
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: screenUtil.setSp(30),
                    fontWeight: FontWeight.bold,
                  ),
            );
          },
        ),
        const Spacer(),
        Wrap(
          children: [
            GestureDetector(
                onTap: () {
                  context.read<CalendarBloc>().add(PrevMonthEvent());
                },
                child: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 30,
                )),
            const SizedBox(
              width: 15,
            ),
            GestureDetector(
                onTap: () {
                  context.read<CalendarBloc>().add(NextMonthEvent());
                },
                child: const Icon(Icons.arrow_forward_ios_rounded, size: 30)),
          ],
        )
      ],
    );
    ;
  }
}
