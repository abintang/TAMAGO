import 'package:tamago/features/home/domain/entities/anime_upcoming_entity.dart';

abstract class AnimeUpcomingRepository {
  Future<List<AnimeUpcomingEntity>> getAnimeUpcoming();
}
