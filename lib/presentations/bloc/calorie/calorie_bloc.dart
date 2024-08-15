import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'calorie_event.dart';
part 'calorie_state.dart';

class CalorieBloc extends Bloc<CalorieEvent, CalorieState> {
  CalorieBloc() : super(CalorieInitial()) {
    on<CalorieEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
