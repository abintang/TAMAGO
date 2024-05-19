import 'package:json_annotation/json_annotation.dart';
import 'package:tamago/features/home/data/models/sub_model.dart';
import 'package:tamago/features/home/domain/entities/anime_recommendations_entity.dart';
part 'anime_recommendations_model.g.dart';

@JsonSerializable()
class AnimeRecommendations extends AnimeRecommendationsEntity {
  AnimeRecommendations(
      {required String route,
      required String title,
      String? status,
      int? episodes,
      required String imageVersionRoute,
      required NamesModel names})
      : super(
            route: route,
            title: title,
            status: status ?? "",
            episodes: episodes ?? 0,
            imageVersionRoute: imageVersionRoute,
            names: names);

  factory AnimeRecommendations.fromJson(Map<String, dynamic> json) =>
      _$AnimeRecommendationsFromJson(json);

  Map<String, dynamic> toJson() => _$AnimeRecommendationsToJson(this);
}
