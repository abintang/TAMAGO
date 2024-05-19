import 'package:tamago/core/di/dependency_injection.dart';
import 'package:tamago/features/home/data/data_sources/anime_upcoming_remote.dart';
import 'package:tamago/features/home/data/models/anime_upcoming_model.dart';
import 'package:tamago/features/home/domain/repositories/anime_upcoming_repository.dart';

class AnimeUpcomingRepositoryImpl implements AnimeUpcomingRepository {
  @override
  Future<List<AnimeUpcomingModel>> getAnimeUpcoming() async {
    final remoteAnimeUpcoming =
        await getIt.get<AnimeUpcomingRemote>().getAnimeUpcoming();
    return remoteAnimeUpcoming;
  }
}
