import 'package:json_annotation/json_annotation.dart';
import 'package:tamago/features/schedule/data/models/sub_model.dart';
import 'package:tamago/features/schedule/domain/entities/anime_schedule_entity.dart';
part 'anime_schedule_model.g.dart';

@JsonSerializable()
class AnimeScheduleModel extends AnimeScheduleEntity {
  AnimeScheduleModel(
      {required String route,
      required String title,
      String? english,
      required String episodeDate,
      required int episodeNumber,
      int? episodes,
      required String imageVersionRoute,
      required bool donghua,
      required StreamsModel streams,
      required String airType})
      : super(
            route: route,
            title: title,
            english: english ?? title,
            episodeDate: episodeDate,
            episodeNumber: episodeNumber,
            episodes: episodes ?? 0,
            imageVersionRoute: imageVersionRoute,
            donghua: donghua,
            streams: streams,
            airType: airType);

  factory AnimeScheduleModel.fromJson(Map<String, dynamic> json) =>
      _$AnimeScheduleModelFromJson(json);

  Map<String, dynamic> toJson() => _$AnimeScheduleModelToJson(this);
}
