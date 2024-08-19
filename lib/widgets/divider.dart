import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

class MyDivider extends StatelessWidget {
  const MyDivider({super.key});

  @override
  Widget build(BuildContext context) {
    final screenUtil = GetIt.I<ScreenUtil>();
    return Padding(
      padding: EdgeInsets.only(top: screenUtil.setHeight(80)),
      child: const Divider(),
    );
  }
}
