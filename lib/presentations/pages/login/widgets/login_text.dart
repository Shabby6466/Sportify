import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:sportify/presentations/pages/themes/my_colors.dart';

class LoginTextField extends StatelessWidget {
  final String label, hint;

  const LoginTextField({
    super.key,
    required this.label,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    final screenUtil = GetIt.I<ScreenUtil>();
    return TextField(
      style: Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(color: MyColors.secondaryBlack),
      decoration: InputDecoration(
          labelText: label,
          labelStyle: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(fontSize: screenUtil.setSp(16)),
          hintText: hint,
          hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: MyColors.secondaryBlack.withOpacity(0.2),
              ),
          border: OutlineInputBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(screenUtil.radius(8))),
          )),
    );
  }
}
