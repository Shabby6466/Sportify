import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:sportify/presentations/pages/themes/my_colors.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    final screenUtil = GetIt.I<ScreenUtil>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Chal",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontSize: screenUtil.setSp(40),
              fontWeight: FontWeight.bold,
              color: MyColors.primaryBlack),
        ),
        SizedBox(width: screenUtil.setWidth(2)),
        Align(
            alignment: const Alignment(0, 0.05),
            child: Text(
              "Pro",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: screenUtil.setSp(40),
                  fontWeight: FontWeight.bold,
                  color: MyColors.buttonPrimary),
            ))
      ],
    );
  }
}
