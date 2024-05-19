import 'package:tamago/core/di/dependency_injection.dart';
import 'package:tamago/features/home/data/data_sources/anime_today_remote.dart';
import 'package:tamago/features/home/data/models/anime_today_model.dart';
import 'package:tamago/features/home/domain/repositories/anime_today_repository.dart';

class AnimeTodayRepositoryImpl implements AnimeTodayRepository {
  @override
  Future<List<AnimeTodayModel>> getAnimeToday(String year, String week) async {
    final remoteAnimeToday =
        await getIt.get<AnimeTodayRemote>().getAnimeToday(year, week);
    return remoteAnimeToday;
  }
}
