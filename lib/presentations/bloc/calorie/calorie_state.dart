part of 'calorie_bloc.dart';

sealed class CalorieState extends Equatable {
  const CalorieState();
}

final class CalorieInitial extends CalorieState {
  @override
  List<Object> get props => [];
}
