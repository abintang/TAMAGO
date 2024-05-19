import 'package:tamago/features/schedule/domain/entities/anime_schedule_entity.dart';

abstract class AnimeScheduleRepository {
  Future<List<AnimeScheduleEntity>> getAnimeSchedule(String year, String week);
}
