import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'calendar_event.dart';

part 'calendar_state.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  CalendarBloc() : super(CalendarStateInitial()) {
    on<LoadCalendarEvent>((event, emit) async {
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

      final tickedDates = await loadTickedDates();

      emit(CalendarStateLoaded(
        days: days,
        selectedDate: null,
        tickedDates: tickedDates,
      ));
    });

    on<TapEvent>((event, emit) {
      emit(CalendarStateLoaded(
        days: (state as CalendarStateLoaded).days,
        selectedDate: event.day,
        tickedDates: (state as CalendarStateLoaded).tickedDates,
      ));
    });

    on<LongPressEvent>((event, emit) async {
      if (state is CalendarStateLoaded) {
        final currentState = state as CalendarStateLoaded;
        final updatedTickedDates =
            List<DateTime>.from(currentState.tickedDates);

        if (updatedTickedDates.contains(event.ticked)) {
          updatedTickedDates.remove(event.ticked);
        } else {
          updatedTickedDates.add(event.ticked);
        }

        await savedTickedDates(updatedTickedDates);

        emit(currentState.copyWith(tickedDates: updatedTickedDates));
      }
    });

    on<NextMonthEvent>((event, emit) async {
      if (state is CalendarStateLoaded) {
        final currentState = state as CalendarStateLoaded;
        final currentMonth = currentState.days.first.month;
        final currentYear = currentState.days.first.year;

        final nextMonth = currentMonth == 12 ? 1 : currentMonth + 1;
        final nextYear = currentMonth == 12 ? currentYear + 1 : currentYear;

        final List<DateTime> nextMonthDays = [];
        final daysInNextMonth = DateTime(nextYear, nextMonth + 1, 0).day;

        for (int i = 1; i <= daysInNextMonth; i++) {
          nextMonthDays.add(DateTime(nextYear, nextMonth, i));
        }

        final tickedDates = await loadTickedDates();

        emit(CalendarStateLoaded(
          days: nextMonthDays,
          selectedDate: null,
          tickedDates: tickedDates,
        ));
      }
    });

    on<PrevMonthEvent>((event, emit) async {
      if (state is CalendarStateLoaded) {
        final currentState = state as CalendarStateLoaded;
        final currentMonth = currentState.days.first.month;
        final currentYear = currentState.days.first.year;

        final prevMonth = currentMonth == 1 ? 12 : currentMonth - 1;
        final prevYear = currentMonth == 1 ? currentYear - 1 : currentYear;

        final List<DateTime> prevMonthDays = [];
        final daysInPrevMonth = DateTime(prevYear, prevMonth + 1, 0).day;

        for (int i = 1; i <= daysInPrevMonth; i++) {
          prevMonthDays.add(DateTime(prevYear, prevMonth, i));
        }

        final tickedDates = await loadTickedDates();

        emit(CalendarStateLoaded(
          days: prevMonthDays,
          selectedDate: null,
          tickedDates: tickedDates,
        ));
      }
    });
  }
}

Future<void> savedTickedDates(List<DateTime> tickedDates) async {
  final prefs = await SharedPreferences.getInstance();
  final dateStrings =
      tickedDates.map((date) => date.toIso8601String()).toList();
  await prefs.setStringList('ticked', dateStrings);
}

Future<List<DateTime>> loadTickedDates() async {
  final prefs = await SharedPreferences.getInstance();
  final dateStrings = prefs.getStringList('ticked') ?? [];
  return dateStrings.map((dateStr) => DateTime.parse(dateStr)).toList();
}
