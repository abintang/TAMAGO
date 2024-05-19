class DiscoverMoreEntity {
  String genre;
  String imageRoute_1;
  String imageRoute_2;
  String imageRoute_3;
  String imageRoute_4;

  DiscoverMoreEntity(
      {required this.genre,
      String? imageRoute_1,
      String? imageRoute_2,
      String? imageRoute_3,
      String? imageRoute_4})
      : imageRoute_1 = imageRoute_1 ?? "",
        imageRoute_2 = imageRoute_2 ?? "",
        imageRoute_3 = imageRoute_3 ?? "",
        imageRoute_4 = imageRoute_4 ?? "";
}
