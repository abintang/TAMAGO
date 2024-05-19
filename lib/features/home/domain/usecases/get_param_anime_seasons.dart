class GetParamAnimeSeasons {
  DateTime now = DateTime.now();

  String getLastYear() {
    return (now.month >= 1 && now.month <= 3)
        ? (now.year - 1).toString()
        : now.year.toString();
  }

  String getLastSeasons() {
    int month = now.month;
    if (month >= 1 && month <= 3) {
      return "fall";
    } else if (month >= 4 && month <= 6) {
      return "winter";
    } else if (month >= 7 && month <= 9) {
      return "spring";
    } else if (month >= 10 && month <= 12) {
      return "summer";
    } else {
      return "";
    }
  }
}
