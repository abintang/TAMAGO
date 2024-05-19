import 'package:tamago/features/home/domain/entities/anime_recommendations_entity.dart';
import 'package:tamago/features/home/domain/entities/anime_today_entity.dart';
import 'package:tamago/features/home/domain/entities/anime_upcoming_entity.dart';
import 'package:tamago/features/home/domain/entities/discover_more_entity.dart';

abstract class HomeState {}

class IntialState extends HomeState {}

class LoadingRecommendedAnime extends HomeState {}

class GetRecommendedAnimeSuccess extends HomeState {
  final List<AnimeRecommendationsEntity> recommendedAnime;

  GetRecommendedAnimeSuccess({required this.recommendedAnime});
}

class GetRecommendedAnimeFailed extends HomeState {}

class LoadingAnimeToday extends HomeState {}

class GetAnimeTodaySuccess extends HomeState {
  final List<AnimeTodayEntity> animeToday;

  GetAnimeTodaySuccess({required this.animeToday});
}

class GetAnimeTodayFailed extends HomeState {}

class LoadingAnimeUpcoming extends HomeState {}

class GetAnimeUpcomingSuccess extends HomeState {
  final List<AnimeUpcomingEntity> animeUpcoming;

  GetAnimeUpcomingSuccess({required this.animeUpcoming});
}

class GetAnimeUpcomingFailed extends HomeState {}

class LoadingDiscoverMore extends HomeState {}

class GetDiscoverMoreSuccess extends HomeState {
  final List<DiscoverMoreEntity> discoverMoreContent;

  GetDiscoverMoreSuccess({required this.discoverMoreContent});
}

class GetDiscoverMoreFailed extends HomeState {}
