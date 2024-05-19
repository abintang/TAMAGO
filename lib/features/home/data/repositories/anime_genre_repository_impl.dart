import 'package:tamago/core/di/dependency_injection.dart';
import 'package:tamago/features/home/data/data_sources/anime_genre_remote.dart';
import 'package:tamago/features/home/domain/entities/anime_recommendations_entity.dart';
import 'package:tamago/features/home/domain/repositories/anime_genre_repository.dart';

class AnimeGenreRepositoryImpl implements AnimeGenreRepository {
  @override
  Future<List<AnimeRecommendationsEntity>> getAnimeBasedOnGenre(
      String genre, int page) async {
    final remoteAnimeGenre =
        await getIt.get<AnimeGenreRemote>().getAnime(genre, page);
    return remoteAnimeGenre;
  }
}
