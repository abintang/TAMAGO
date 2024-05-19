import 'package:tamago/features/home/domain/entities/anime_recommendations_entity.dart';

abstract class AnimeGenreRepository {
  Future<List<AnimeRecommendationsEntity>> getAnimeBasedOnGenre(
      String genre, int page);
}
