import 'package:tamago/features/home/domain/entities/anime_recommendations_entity.dart';

abstract class AnimeRecommendationsRepository {
  Future<List<AnimeRecommendationsEntity>> getAnimeRecommendations(
      String year, String seasons);
}
