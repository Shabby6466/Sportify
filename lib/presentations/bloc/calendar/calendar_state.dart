part of 'calendar_bloc.dart';

class CalendarState extends Equatable {
  const CalendarState();

  @override
  List<Object> get props => [];
}

class CalendarStateInitial extends CalendarState {}

class CalendarStateLoaded extends CalendarState {
  final List<DateTime> days;
  final DateTime? selectedDate;
  final List<DateTime> tickedDates;

  const CalendarStateLoaded({
    required this.days,
    required this.selectedDate,
    required this.tickedDates,
  });

  CalendarStateLoaded copyWith({
    List<DateTime>? days,
    DateTime? selectedDate,
    List<DateTime>? tickedDates,
  }) {
    return CalendarStateLoaded(
      days: days ?? this.days,
      selectedDate: selectedDate ?? this.selectedDate,
      tickedDates: tickedDates ?? this.tickedDates,
    );
  }
  @override
  List<Object> get props => [days,selectedDate ?? DateTime.utc(0),tickedDates];
}



