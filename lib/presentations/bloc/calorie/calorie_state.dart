part of 'calorie_bloc.dart';

class CalorieState extends Equatable {
  final int age;
  final bool isMale;
  final double height;
  final double weight;
  final double calories;
  final String activityLevel;

  const CalorieState(
      {this.age = 0,
      this.isMale = true,
      this.height = 0.0,
      this.weight = 0.0,
      this.calories = 0.0,
      this.activityLevel = 'Sedentary'});

  factory CalorieState.initial() => const CalorieState(isMale: true);

  CalorieState copyWith({
    int? age,
    bool? isMale,
    double? height,
    double? weight,
    double? calories,
    String? activityLevel,
  }) {
    return CalorieState(
      age: age ?? this.age,
      isMale: isMale ?? this.isMale,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      calories: calories ?? this.calories,
      activityLevel: activityLevel ?? this.activityLevel,
    );
  }

  @override
  List<Object> get props =>
      [age, isMale, height, weight, calories, activityLevel];
}

final class CalorieInitial extends CalorieState {}
