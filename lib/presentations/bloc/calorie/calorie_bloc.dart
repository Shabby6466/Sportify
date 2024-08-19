import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'calorie_event.dart';

part 'calorie_state.dart';

class CalorieBloc extends Bloc<CalorieEvent, CalorieState> {
  CalorieBloc() : super(CalorieInitial()) {
    on<AgeChanged>(_onAgeChanged);
    on<WeightChanged>(_onWeightChanged);
    on<HeightChanged>(_onHeightChanged);
    on<GenderChanged>(_onGenderChanged);
    on<ActivityChanged>(_activityChanged);
    on<CalorieCalculation>(calorieCalculation);
    on<ResetCalorieState>((event, emit) {
      emit(CalorieInitial());
    });
  }

  void _onAgeChanged(AgeChanged event, Emitter<CalorieState> emit) {
    emit(state.copyWith(age: event.age));
  }

  void _onWeightChanged(WeightChanged event, Emitter<CalorieState> emit) {
    emit(state.copyWith(weight: event.weight));
  }

  void _onHeightChanged(HeightChanged event, Emitter<CalorieState> emit) {
    emit(state.copyWith(height: event.height));
  }

  void _activityChanged(ActivityChanged event, Emitter<CalorieState> emit) {
    emit(state.copyWith(activityLevel: event.activityLevelChanged));
  }

  void _onGenderChanged(GenderChanged event, Emitter<CalorieState> emit) {
    emit(state.copyWith(isMale: event.isMale));
  }

  void calorieCalculation(
      CalorieCalculation event, Emitter<CalorieState> emit) {
    bool _visible = true;
    final calorie = calculateCalorie(
      age: state.age,
      isMale: state.isMale,
      weight: state.weight,
      height: state.height,
      activityLevel: state.activityLevel,
    );
    emit(state.copyWith(calories: calorie, visible: _visible));
  }

  double calculateCalorie({
    required int age,
    required bool isMale,
    required double weight,
    required double height,
    required String activityLevel,
  }) {
    double bmr;
    if (isMale) {
      bmr = 88.362 + (13.397 * weight) + (4.799 * height) - (5.677 * age);
    } else {
      bmr = 447.593 + (9.247 * weight) + (3.098 * height) - (4.330 * age);
    }

    switch (activityLevel) {
      case 'Sedentary':
        return (bmr * 1.2);
      case 'Light':
        return bmr * 1.375;
      case 'Moderate':
        return bmr * 1.55;
      case 'Active':
        return bmr * 1.725;
      case 'Very Active':
        return bmr * 1.9;
      default:
        return bmr * 1.2;
    }
  }
}
