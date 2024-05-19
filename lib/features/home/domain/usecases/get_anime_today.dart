import 'package:tamago/core/di/dependency_injection.dart';
import 'package:tamago/features/home/domain/entities/anime_today_entity.dart';
import 'package:tamago/features/home/domain/repositories/anime_today_repository.dart';
import 'package:tamago/features/home/domain/usecases/get_current_date.dart';

class GetAnimeToday {
  Future<List<AnimeTodayEntity>> call() async {
    final getDate = getIt.get<GetDate>();
    final anime = await getIt
        .get<AnimeTodayRepository>()
        .getAnimeToday(getDate.getYear(), getDate.getCurrentWeek());
    final filteredAnime = anime
        .where((item) =>
            item.episodeDate.contains(getDate.getCurrentDate()) &&
            !item.donghua &&
            !item.episodeDate.contains("00:00:00"))
        .toList();

    return filteredAnime;
  }
}
