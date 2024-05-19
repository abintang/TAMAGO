import 'package:isoweek/isoweek.dart';

class GetDate {
  DateTime now = DateTime.now();
  String getCurrentDate() {
    String formattedDate =
        "${now.year}-${_addLeadingZero(now.month)}-${_addLeadingZero(now.day)}";
    return formattedDate;
  }

  String getYear() {
    return now.year.toString();
  }

  String getCurrentWeek() {
    Week currentWeek = Week.current();
    List<String> partsOfString = currentWeek.toString().split('W');
    return partsOfString[1];
  }

  String _addLeadingZero(int number) {
    return number.toString().padLeft(2, '0');
  }
}
