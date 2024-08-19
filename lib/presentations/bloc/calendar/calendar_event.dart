part of 'calendar_bloc.dart';

abstract class CalendarEvent extends Equatable {
  const CalendarEvent();

  @override
  List<Object?> get props => [];
}

class LoadCalendarEvent extends CalendarEvent {}

class TapEvent extends CalendarEvent {
  final DateTime day;

  const TapEvent(this.day);

  @override
  List<Object?> get props => [day];
}

class NextMonthEvent extends CalendarEvent {}

class PrevMonthEvent extends CalendarEvent {}

class LongPressEvent extends CalendarEvent {
  final DateTime ticked;

  const LongPressEvent(this.ticked);

  @override
  List<Object?> get props => [ticked];
}
