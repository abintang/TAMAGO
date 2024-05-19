import 'package:json_annotation/json_annotation.dart';
import 'package:tamago/features/home/domain/entities/anime_today_entity.dart';
part 'anime_today_model.g.dart';

@JsonSerializable()
class AnimeTodayModel extends AnimeTodayEntity {
  AnimeTodayModel(
      {required String route,
      required String title,
      String? english,
      required String episodeDate,
      required int episodeNumber,
      required String imageVersionRoute,
      required bool donghua,
      required String airType})
      : super(
            route: route,
            title: title,
            english: english ?? title,
            episodeDate: episodeDate,
            episodeNumber: episodeNumber,
            imageVersionRoute: imageVersionRoute,
            donghua: donghua,
            airType: airType);

  factory AnimeTodayModel.fromJson(Map<String, dynamic> json) =>
      _$AnimeTodayModelFromJson(json);

  Map<String, dynamic> toJson() => _$AnimeTodayModelToJson(this);
}
