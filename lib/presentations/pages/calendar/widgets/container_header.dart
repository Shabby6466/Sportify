import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

class BuildContainerHeader extends StatelessWidget {
  const BuildContainerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final screenUtil = GetIt.I<ScreenUtil>();
    return Text(
      DateFormat.MMMM().format(DateTime.now()),
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            fontSize: screenUtil.setSp(30),
            fontWeight: FontWeight.bold,
          ),
    );
    ;
  }
}
