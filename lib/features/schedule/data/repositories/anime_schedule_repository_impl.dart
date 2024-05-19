import 'package:tamago/core/di/dependency_injection.dart';
import 'package:tamago/features/schedule/data/data_sources/anime_schedule_remote.dart';
import 'package:tamago/features/schedule/data/models/anime_schedule_model.dart';
import 'package:tamago/features/schedule/domain/repositories/anime_schedule_repository.dart';

class AnimeScheduleRepositoryImpl implements AnimeScheduleRepository {
  @override
  Future<List<AnimeScheduleModel>> getAnimeSchedule(
      String year, String week) async {
    final remoteAnimeSchedule =
        await getIt.get<AnimeScheduleRemote>().getAnimeSchedule(year, week);
    return remoteAnimeSchedule;
  }
}
