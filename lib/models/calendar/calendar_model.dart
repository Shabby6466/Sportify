class CalendarModel {
  int day;
  int month;
  int year;
  int weekday;

  CalendarModel(this.day, this.month, this.year, this.weekday);

  set setDay(int day) {
    this.day = day;
  }

  set setMonth(int month) {
    this.month = month;
  }

  set setYear(int year) {
    this.year = year;
  }

  set setWeekDay(int weekday) {
    this.weekday = weekday;
  }

  int get getDay => day;

  int get getMonth => month;

  int get getYear => year;

  int get getWeekDay => weekday;
}
