import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'calendar_event.dart';

part 'calendar_state.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  CalendarBloc() : super(CalendarStateInitial()) {
    on<LoadCalendarEvent>((event, emit) {
      final DateTime now = DateTime.now();
      final int year = now.year;
      final int month = now.month;

      final List<DateTime> days = [];
      if (month % 2 == 0) {
        if (month == 2) {
          for (int i = 1; i <= 29; i++) {
            days.add(DateTime(year, month, i));
          }
        } else {
          for (int i = 1; i <= 30; i++) {
            days.add(DateTime(year, month, i));
          }
        }
      } else {
        for (int i = 1; i <= 31; i++) {
          days.add(DateTime(year, month, i));
        }
      }
      emit(CalendarStateLoaded(
        days,
        null,
      ));
    });
    on<TapEvent>((event, emit) {
      emit(CalendarStateLoaded((state as CalendarStateLoaded).days, event.day));
    });
  }
}
