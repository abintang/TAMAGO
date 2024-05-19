import 'package:tamago/core/di/dependency_injection.dart';
import 'package:tamago/features/home/domain/entities/anime_upcoming_entity.dart';
import 'package:tamago/features/home/domain/repositories/anime_upcoming_repository.dart';

class GetAnimeUpcoming {
  Future<List<AnimeUpcomingEntity>> call() async {
    final anime = await getIt.get<AnimeUpcomingRepository>().getAnimeUpcoming();
    return anime;
  }
}
