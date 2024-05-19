import 'package:flutter/material.dart';

class StreamsEntity {
  String route;
  String nameStreams;
  String? urlStreams;
  Color colorPallete;
  int sizeImage;

  StreamsEntity(
      {required this.route,
      required this.nameStreams,
      required this.urlStreams,
      required this.colorPallete,
      required this.sizeImage});
}
