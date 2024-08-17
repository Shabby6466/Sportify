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

  const CalendarStateLoaded(
    this.days,
    this.selectedDate,
  );

  @override
  List<Object> get props => [days, selectedDate ?? Object(), ];

  CalendarStateLoaded copyWith({
    List<DateTime>? days,
    DateTime? selectedDate,
    List<DateTime>? ticked,
  }) {
    return CalendarStateLoaded(
      days ?? this.days,
      selectedDate ?? this.selectedDate,
    );
  }
}
