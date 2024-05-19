class GetEllipsizeString {
  String ellipsizeString(String text, int maxLen) {
    if (text.length <= maxLen + 3) {
      return text;
    } else {
      return '${text.substring(0, maxLen)}...';
    }
  }
}
