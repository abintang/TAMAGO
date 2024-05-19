import 'dart:developer';

import 'package:tamago/core/di/dependency_injection.dart';
import 'package:tamago/features/home/domain/entities/anime_recommendations_entity.dart';
import 'package:tamago/features/home/domain/repositories/anime_recommendations_repository.dart';
import 'package:tamago/features/home/domain/usecases/get_param_anime_seasons.dart';

class GetAnimeRecommendations {
  Future<List<AnimeRecommendationsEntity>> call() async {
    log(GetParamAnimeSeasons().getLastSeasons());
    return await getIt
        .get<AnimeRecommendationsRepository>()
        .getAnimeRecommendations(GetParamAnimeSeasons().getLastYear(),
            GetParamAnimeSeasons().getLastSeasons());
  }
}
