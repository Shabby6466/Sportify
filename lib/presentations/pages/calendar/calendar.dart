import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:sportify/presentations/pages/calendar/custom_calendar.dart';
import 'package:sportify/presentations/pages/calendar/widgets/days_counter.dart';
import 'package:sportify/widgets/divider.dart';
import 'package:sportify/widgets/main_scaffold.dart';

class Calendar extends StatelessWidget {
  const Calendar({super.key});

  @override
  Widget build(BuildContext context) {
    final screenUtil = GetIt.I<ScreenUtil>();
    return MainScaffold(
      title: "Fitness Planner",
      bodyContainer: Column(
        children: [
          const MyDivider(),
          Padding(
            padding: EdgeInsets.all(screenUtil.setHeight(12)),
            child: const CustomCalendar(),
          ),
          const Divider(),
          SizedBox(
            height: screenUtil.setHeight(20),
          ),
          const DaysCounter(),
        ],
      ),
    );
  }
}
