import 'package:get_it/get_it.dart';
import 'package:tamago/features/home/data/data_sources/anime_genre_remote.dart';
import 'package:tamago/features/home/data/data_sources/anime_recommendations_remote.dart';
import 'package:tamago/features/home/data/data_sources/anime_today_remote.dart';
import 'package:tamago/features/home/data/data_sources/anime_upcoming_remote.dart';
import 'package:tamago/features/home/data/repositories/anime_genre_repository_impl.dart';
import 'package:tamago/features/home/data/repositories/anime_recommendations_repository_impl.dart';
import 'package:tamago/features/home/data/repositories/anime_today_repository_impl.dart';
import 'package:tamago/features/home/data/repositories/anime_upcoming_repository_impl.dart';
import 'package:tamago/features/home/domain/repositories/anime_genre_repository.dart';
import 'package:tamago/features/home/domain/repositories/anime_recommendations_repository.dart';
import 'package:tamago/features/home/domain/repositories/anime_today_repository.dart';
import 'package:tamago/features/home/domain/repositories/anime_upcoming_repository.dart';
import 'package:tamago/features/home/domain/usecases/get_anime_recommendations.dart';
import 'package:tamago/features/home/domain/usecases/get_anime_today.dart';
import 'package:tamago/features/home/domain/usecases/get_anime_upcoming.dart';
import 'package:tamago/features/home/domain/usecases/get_current_date.dart';
import 'package:tamago/features/home/domain/usecases/get_discover_more.dart';
import 'package:tamago/features/home/domain/usecases/get_ellipsize_string.dart';
import 'package:tamago/features/home/domain/usecases/get_splitted_string.dart';
import 'package:tamago/features/schedule/data/data_sources/anime_schedule_remote.dart';
import 'package:tamago/features/schedule/data/repositories/anime_schedule_repository_impl.dart';
import 'package:tamago/features/schedule/domain/repositories/anime_schedule_repository.dart';
import 'package:tamago/features/schedule/domain/usecases/get_selected_schedule_anime.dart';
import 'package:tamago/features/schedule/domain/usecases/get_streams_anime.dart';

final GetIt getIt = GetIt.instance;

void configure() {
  /// AnimeRecommendations
  getIt.registerLazySingleton<AnimeRecommendationsRemote>(
      () => AnimeRecommendationsRemoteImpl());
  getIt.registerLazySingleton<AnimeRecommendationsRepository>(
      () => AnimeRecommendationsRepositoryImpl());
  getIt.registerLazySingleton<GetAnimeRecommendations>(
      () => GetAnimeRecommendations());

  /// Anime Today
  getIt.registerLazySingleton<AnimeTodayRemote>(() => AnimeTodayRemoteImpl());
  getIt.registerLazySingleton<AnimeTodayRepository>(
      () => AnimeTodayRepositoryImpl());
  getIt.registerLazySingleton<GetAnimeToday>(() => GetAnimeToday());

  /// Anime Upcoming
  getIt.registerLazySingleton<AnimeUpcomingRemote>(
      () => AnimeUpcomingRemoteImpl());
  getIt.registerLazySingleton<AnimeUpcomingRepository>(
      () => AnimeUpcomingRepositoryImpl());
  getIt.registerLazySingleton<GetAnimeUpcoming>(() => GetAnimeUpcoming());

  /// AnimeGenre
  getIt.registerLazySingleton<AnimeGenreRemote>(() => AnimeGenreRemoteImpl());
  getIt.registerLazySingleton<AnimeGenreRepository>(
      () => AnimeGenreRepositoryImpl());
  getIt.registerLazySingleton<GetDiscoverMore>(() => GetDiscoverMore());

  /// Anime Schedule
  getIt.registerLazySingleton<AnimeScheduleRemote>(
      () => AnimeScheduleRemoteImpl());
  getIt.registerLazySingleton<AnimeScheduleRepository>(
      () => AnimeScheduleRepositoryImpl());

  /// Get-Usecases
  getIt.registerLazySingleton<GetDate>(() => GetDate());
  getIt.registerLazySingleton<GetSplittedString>(() => GetSplittedString());
  getIt.registerLazySingleton<GetEllipsizeString>(() => GetEllipsizeString());

  getIt.registerLazySingleton<GetSelectedScheduleAnime>(
      () => GetSelectedScheduleAnime());
  getIt.registerLazySingleton<GetStreamsAnime>(() => GetStreamsAnime());
}
