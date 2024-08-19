part of 'calorie_bloc.dart';

abstract class CalorieEvent extends Equatable {
  const CalorieEvent();

  @override
  List<Object> get props => [];
}

class Initial extends CalorieEvent {}

class AgeChanged extends CalorieEvent {
  final int age;

  const AgeChanged(this.age);

  @override
  List<Object> get props => [age];
}

class GenderChanged extends CalorieEvent {
  final bool isMale;

  const GenderChanged(this.isMale);

  @override
  List<Object> get props => [isMale];
}

class HeightChanged extends CalorieEvent {
  final double height;

  const HeightChanged(this.height);

  @override
  List<Object> get props => [height];
}

class WeightChanged extends CalorieEvent {
  final double weight;

  const WeightChanged(this.weight);

  @override
  List<Object> get props => [weight];
}

class ActivityChanged extends CalorieEvent {
  final String activityLevelChanged;

  const ActivityChanged(this.activityLevelChanged);

  @override
  List<Object> get props => [activityLevelChanged];
}

class CalorieCalculation extends CalorieEvent {
  final double calorie;
  final bool visible;

  const CalorieCalculation(this.calorie, this.visible);

  @override
  List<Object> get props => [calorie, visible];
}

class ResetCalorieState extends CalorieEvent {}
