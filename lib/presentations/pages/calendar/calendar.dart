import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:sportify/presentations/pages/calendar/custom_calendar.dart';
import 'package:sportify/widgets/main_scaffold.dart';

class Calendar extends StatelessWidget {
  const Calendar({super.key});

  @override
  Widget build(BuildContext context) {
    print('build');
    final screenUtil = GetIt.I<ScreenUtil>();
    return MainScaffold(
      title: "Fitness Planner",
      bodyContainer: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(
                screenUtil.setSp(0), 80, screenUtil.setSp(0), 0),
            child: const Divider(),
          ),
          const CustomCalendar(),
          const Divider(),
        ],
      ),
    );
  }
}
