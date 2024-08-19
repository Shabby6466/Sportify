import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:sportify/presentations/bloc/calorie/calorie_bloc.dart';
import 'package:sportify/presentations/bloc/calorie/widgets/textfields.dart';
import 'package:sportify/presentations/pages/themes/my_colors.dart';
import 'package:sportify/widgets/main_scaffold.dart';

class CalorieCalculator extends StatefulWidget {
  const CalorieCalculator({super.key});

  @override
  State<CalorieCalculator> createState() => _CalorieCalculatorState();
}

class _CalorieCalculatorState extends State<CalorieCalculator> {
  final formKey = GlobalKey<FormState>();
  late ValueNotifier<double> caloriesNotifier;

  @override
  void initState() {
    super.initState();
    caloriesNotifier = ValueNotifier<double>(0);
  }

  @override
  Widget build(BuildContext context) {
    MyTextFields textfields = MyTextFields();
    final screenUtil = GetIt.I<ScreenUtil>();
    return MainScaffold(
      title: "Calorie Calculator",
      bodyContainer: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(
                screenUtil.setSp(0), 80, screenUtil.setSp(0), 0),
            child: const Divider(),
          ),
          SizedBox(
            height: screenUtil.setHeight(20),
          ),
          BlocBuilder<CalorieBloc, CalorieState>(builder: (context, state) {
            caloriesNotifier = ValueNotifier<double>(
                context.read<CalorieBloc>().state.calories);
            return Padding(
              padding: EdgeInsets.all(screenUtil.radius(20)),
              child: Column(
                children: [
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        textfields.buildTextFormField(
                            label: "Enter Age",
                            validator: (value) =>
                                textfields.validation(value!, 'age'),
                            onChanged: (val) {
                              if (val.isNotEmpty) {
                                final int? age = int.tryParse(val);
                                if (age != null) {
                                  context
                                      .read<CalorieBloc>()
                                      .add(AgeChanged(age));
                                }
                              }
                            }),
                        SizedBox(
                          height: screenUtil.setHeight(16),
                        ),
                        textfields.buildTextFormField(
                            label: "Weight in kgs",
                            validator: (value) =>
                                textfields.validation(value!, 'weight'),
                            onChanged: (val) {
                              if (val.isNotEmpty) {
                                final double? weight = double.tryParse(val);
                                if (weight != null) {
                                  context
                                      .read<CalorieBloc>()
                                      .add(WeightChanged(weight));
                                }
                              }
                            }),
                        SizedBox(
                          height: screenUtil.setHeight(16),
                        ),
                        textfields.buildTextFormField(
                            label: "Height in cms",
                            validator: (value) =>
                                textfields.validation(value!, 'height'),
                            onChanged: (val) {
                              if (val.isNotEmpty) {
                                final double? height = double.tryParse(val);
                                if (height != null) {
                                  context
                                      .read<CalorieBloc>()
                                      .add(HeightChanged(height));
                                }
                              }
                            })
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenUtil.setHeight(20),
                  ),
                  DropdownButtonFormField(
                    alignment: AlignmentDirectional.center,
                    value: 'Sedentary',
                    onChanged: (value) {
                      final String? activity = value;
                      if (activity != null) {
                        context
                            .read<CalorieBloc>()
                            .add(ActivityChanged(activity));
                      }
                    },
                    items: const [
                      DropdownMenuItem(
                        value: 'Sedentary',
                        child: Text('Sedentary'),
                      ),
                      DropdownMenuItem(
                        value: 'Light',
                        child: Text('Light'),
                      ),
                      DropdownMenuItem(
                        value: 'Moderate',
                        child: Text('Moderate'),
                      ),
                      DropdownMenuItem(
                        value: 'Active',
                        child: Text('Active'),
                      ),
                      DropdownMenuItem(
                        value: 'Very Active',
                        child: Text('Very Active'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenUtil.setHeight(20),
                  ),
                  Align(
                    alignment: AlignmentDirectional.topStart,
                    child: SizedBox(
                      width: MediaQuery.sizeOf(context).width,
                      child: ElevatedButton(
                          onPressed: () {
                            context
                                .read<CalorieBloc>()
                                .add(GenderChanged(!state.isMale));
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: MyColors.buttonPrimary,
                              foregroundColor: MyColors.bgWhite),
                          child: Text(state.isMale ? "Male" : 'Female')),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: MyColors.buttonPrimary,
                          foregroundColor: MyColors.bgWhite),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          context
                              .read<CalorieBloc>()
                              .add(const CalorieCalculation(0));
                        }
                      },
                      child: const Text("Calculate"),
                    ),
                  ),
                  SizedBox(height: screenUtil.setHeight(20)),
                  Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: screenUtil.setHeight(200),
                    decoration: BoxDecoration(
                        color: MyColors.buttonPrimary.withOpacity(0.14),
                        borderRadius:
                            BorderRadius.circular(screenUtil.radius(10))),
                    child: Padding(
                        padding: EdgeInsets.all(screenUtil.radius(16)),
                        child: Column(
                          children: [
                            Text("Result",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(fontWeight: FontWeight.w700)),
                            ValueListenableBuilder(
                              valueListenable: caloriesNotifier,
                              builder: (context, value, child) {
                                if (value != 0) {
                                  return Text(
                                    "You will have to maintain ${value.round()} calories",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                            fontSize: screenUtil.setSp(18.5),
                                            fontWeight: FontWeight.w600),
                                  );
                                }
                                return const SizedBox.shrink();
                              },
                            ),
                          ],
                        )),
                  )
                ],
              ),
            );
          })
        ],
      ),
    );
  }
}
