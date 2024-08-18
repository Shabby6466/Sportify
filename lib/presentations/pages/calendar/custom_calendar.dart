import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:sportify/presentations/bloc/calendar/calendar_bloc.dart';

class CustomCalendar extends StatefulWidget {
  const CustomCalendar({super.key});

  @override
  State<CustomCalendar> createState() => _CustomCalendarState();
}

final screenUtil = GetIt.I<ScreenUtil>();

class _CustomCalendarState extends State<CustomCalendar> {
  DateTime today = DateTime.now();

  @override
  void initState() {
    super.initState();
    context.read<CalendarBloc>().add(LoadCalendarEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: screenUtil.setWidth(20), right: screenUtil.setWidth(16)),
          child: buildContainerHeader(context),
        ),
        SizedBox(height: screenUtil.setHeight(20)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat']
              .map((day) => Expanded(
                    child: Center(
                      child: Text(
                        day,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: screenUtil.setSp(18),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ))
              .toList(),
        ),
        BlocBuilder<CalendarBloc, CalendarState>(
          builder: (context, state) {
            if (state is CalendarStateInitial) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CalendarStateLoaded) {
              if (state.days.isEmpty) {
                return const Center(child: Text('No days available'));
              } else {
                final firstDayOfMonth =
                    DateTime(state.days.first.year, state.days.first.month, 1);
                final startingWeekday = firstDayOfMonth.weekday % 7;

                final totalItemCount = state.days.length + startingWeekday;

                return GridView.builder(
                  padding: EdgeInsets.zero,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 7,
                  ),
                  shrinkWrap: true,
                  itemCount: totalItemCount,
                  itemBuilder: (context, index) {
                    if (index < startingWeekday) {
                      return const SizedBox();
                    }
                    final day = state.days[index - startingWeekday];
                    bool isSelected = day.day == DateTime.now().day &&
                        day.month == DateTime.now().month &&
                        day.year == DateTime.now().year;

                    bool isBeforeToday = day.isBefore(today);
                    bool isTicked = state.tickedDates.contains(day);

                    return GestureDetector(
                      onDoubleTap: () {
                        if (!isBeforeToday) {
                          context.read<CalendarBloc>().add(LongPressEvent(day));
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.blue : Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Stack(
                          children: [
                            Center(
                              child: Text(
                                day.day.toString(),
                                style: TextStyle(
                                  fontSize: 24,
                                  color:
                                      isSelected ? Colors.white : Colors.black,
                                ),
                              ),
                            ),
                            if (isTicked)
                              const Positioned(
                                bottom: 6,
                                right: -0.5,
                                child: Icon(Icons.check_circle, size: 12),
                              ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            } else {
              return const Center(child: Text('Unknown state'));
            }
          },
        )
      ],
    );
  }
}

Widget buildContainerHeader(BuildContext context) {
  return Text(
    DateFormat.MMMM().format(DateTime.now()),
    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
          fontSize: screenUtil.setSp(30),
          fontWeight: FontWeight.bold,
        ),
  );
}
