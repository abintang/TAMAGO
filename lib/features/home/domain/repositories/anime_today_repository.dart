import 'package:tamago/features/home/domain/entities/anime_today_entity.dart';

abstract class AnimeTodayRepository {
  Future<List<AnimeTodayEntity>> getAnimeToday(String year, String week);
}
