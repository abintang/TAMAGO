import 'package:isoweek/isoweek.dart';

class GetSelectedDate {
  final String selectedDate;
  GetSelectedDate({required this.selectedDate});

  String selectedDateFormat() {
    List<String> split = selectedDate.split(' ');
    return split[0];
  }

  int getYear() {
    List<String> split = selectedDate.split('-');
    return int.parse(split[0]);
  }

  int getMonth() {
    List<String> split = selectedDate.split('-');
    return int.parse(split[1]);
  }

  int getDate() {
    return int.parse(selectedDate.split('-')[2].split(' ')[0]);
  }

  String getWeek() {
    String week =
        Week.fromDate(DateTime(getYear(), getMonth(), getDate())).toString();
    List<String> partsOfString = week.split('W');
    return partsOfString[1];
  }
}
