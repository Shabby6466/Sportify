import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:sportify/presentations/bloc/calorie/calorie_bloc.dart';
import 'package:sportify/presentations/bloc/calorie/widgets/textfields.dart';
import 'package:sportify/presentations/pages/calorie_calc/widgets/result_container.dart';
import 'package:sportify/presentations/pages/themes/my_colors.dart';
import 'package:sportify/widgets/divider.dart';
import 'package:sportify/widgets/main_scaffold.dart';

class CalorieCalculator extends StatefulWidget {
  const CalorieCalculator({super.key});

  @override
  State<CalorieCalculator> createState() => _CalorieCalculatorState();
}

class _CalorieCalculatorState extends State<CalorieCalculator> {
  final formKey = GlobalKey<FormState>();

  bool visible = false;

  @override
  Widget build(BuildContext context) {
    MyTextFields textFields = MyTextFields();
    final screenUtil = GetIt.I<ScreenUtil>();
    return MainScaffold(
      title: "Calorie Calculator",
      bodyContainer: Column(
        children: [
          const MyDivider(),
          SizedBox(
            height: screenUtil.setHeight(20),
          ),
          BlocBuilder<CalorieBloc, CalorieState>(builder: (context, state) {
            return Padding(
              padding: EdgeInsets.all(screenUtil.radius(30)),
              child: Column(
                children: [
                  Form(
                    key: formKey,
                    child: Wrap(
                      runSpacing: 15.0,
                      children: [
                        textFields.buildTextFormField(
                            label: "Enter Age",
                            validator: (value) =>
                                textFields.validation(value!, 'age'),
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
                        textFields.buildTextFormField(
                            label: "Weight in kgs",
                            validator: (value) =>
                                textFields.validation(value!, 'weight'),
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
                        textFields.buildTextFormField(
                            label: "Height in cms",
                            validator: (value) =>
                                textFields.validation(value!, 'height'),
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
                  Wrap(
                    children: [
                      Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Text(
                            "Activity",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                          )),
                      DropdownButtonFormField(
                        alignment: AlignmentDirectional.centerStart,
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
                              .add(const CalorieCalculation(0, true));
                        }
                      },
                      child: const Text("Calculate"),
                    ),
                  ),
                  SizedBox(height: screenUtil.setHeight(20)),
                  const ResultContainer()
                ],
              ),
            );
          })
        ],
      ),
    );
  }
}
