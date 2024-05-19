class GetSplittedString {
  String getSplitEpisodeDate(String episodeDate) {
    List<String> parts = episodeDate.split("T");
    String timeWithOffset = parts[1];
    List<String> timeParts = timeWithOffset.split(":");
    String time = "${timeParts[0]}:${timeParts[1]}";
    return time;
  }

  String getSplitEpisodeYearMonthDay(String episodeDate) {
    List<String> parts = episodeDate.split("T");
    String timeWithOffset = parts[0];

    return timeWithOffset;
  }

  String getDate(String premier) {
    if (premier != "0001-01-01T00:00:00Z") {
      List<String> parts = premier.split(RegExp(r'[-T]'));
      return parts[2];
    } else {
      return "";
    }
  }

  int getYear(String date) {
    List<String> split = date.split('-');
    return int.parse(split[0]);
  }

  int getMonth(String date) {
    List<String> split = date.split('-');
    return int.parse(split[1]);
  }

  int getDay(String date) {
    List<String> splitString = date.split("T");

    String datePart = splitString[0];

    List<String> splitDate = datePart.split("-");

    String day = splitDate[2];
    return int.parse(day);
  }
}
