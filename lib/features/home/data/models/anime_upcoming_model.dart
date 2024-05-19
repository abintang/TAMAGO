import 'package:json_annotation/json_annotation.dart';
import 'package:tamago/features/home/data/models/sub_model.dart';
import 'package:tamago/features/home/domain/entities/anime_upcoming_entity.dart';
part 'anime_upcoming_model.g.dart';

@JsonSerializable()
class AnimeUpcomingModel extends AnimeUpcomingEntity {
  AnimeUpcomingModel(
      {required String route,
      required String title,
      required String premier,
      required String? month,
      required int? year,
      required String jpnTime,
      required String imageVersionRoute,
      required NamesModel names})
      : super(
            route: route,
            title: title,
            premier: premier,
            month: month ?? "",
            year: year ?? 0,
            jpnTime: jpnTime,
            imageVersionRoute: imageVersionRoute,
            names: names);

  factory AnimeUpcomingModel.fromJson(Map<String, dynamic> json) =>
      _$AnimeUpcomingModelFromJson(json);

  Map<String, dynamic> toJson() => _$AnimeUpcomingModelToJson(this);
}
