import 'package:tamago/core/di/dependency_injection.dart';
import 'package:tamago/features/home/data/data_sources/anime_recommendations_remote.dart';
import 'package:tamago/features/home/data/models/anime_recommendations_model.dart';
import 'package:tamago/features/home/domain/repositories/anime_recommendations_repository.dart';

class AnimeRecommendationsRepositoryImpl
    implements AnimeRecommendationsRepository {
  @override
  Future<List<AnimeRecommendations>> getAnimeRecommendations(
      String year, String seasons) async {
    final remoteAnimeRecommendations =
        await getIt.get<AnimeRecommendationsRemote>().getAnime(year, seasons);
    return remoteAnimeRecommendations;
  }
}
