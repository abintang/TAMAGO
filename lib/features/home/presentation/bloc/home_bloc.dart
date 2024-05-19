import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tamago/core/di/dependency_injection.dart';
import 'package:tamago/features/home/domain/usecases/get_anime_recommendations.dart';
import 'package:tamago/features/home/domain/usecases/get_anime_today.dart';
import 'package:tamago/features/home/domain/usecases/get_anime_upcoming.dart';
import 'package:tamago/features/home/domain/usecases/get_discover_more.dart';
import 'package:tamago/features/home/presentation/bloc/events/home_event.dart';
import 'package:tamago/features/home/presentation/bloc/states/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(IntialState()) {
    on<LoadRecommendedAnime>(_onLoadRecommendedAnime);
    on<LoadTodayAnime>(_onLoadTodayAnime);
    on<LoadUpcomingAnime>(_onLoadUpcomingAnime);
    on<LoadDiscoverMoreContent>(_onLoadDiscoverMore);
  }

  void _onLoadRecommendedAnime(
      LoadRecommendedAnime event, Emitter<HomeState> emit) async {
    emit(LoadingRecommendedAnime());
    try {
      final anime = await getIt.get<GetAnimeRecommendations>().call();
      emit(GetRecommendedAnimeSuccess(recommendedAnime: anime));
    } catch (e) {
      emit(GetRecommendedAnimeFailed());
    }
  }

  void _onLoadTodayAnime(LoadTodayAnime event, Emitter<HomeState> emit) async {
    emit(LoadingAnimeToday());
    try {
      final anime = await getIt.get<GetAnimeToday>().call();
      emit(GetAnimeTodaySuccess(animeToday: anime));
    } catch (e) {
      emit(GetAnimeTodayFailed());
    }
  }

  void _onLoadUpcomingAnime(
      LoadUpcomingAnime event, Emitter<HomeState> emit) async {
    emit(LoadingAnimeUpcoming());
    try {
      final anime = await getIt.get<GetAnimeUpcoming>().call();
      emit(GetAnimeUpcomingSuccess(animeUpcoming: anime));
    } catch (e) {
      emit(GetAnimeUpcomingFailed());
    }
  }

  void _onLoadDiscoverMore(
      LoadDiscoverMoreContent event, Emitter<HomeState> emit) async {
    emit(LoadingDiscoverMore());
    try {
      final anime = await getIt.get<GetDiscoverMore>().call();
      emit(GetDiscoverMoreSuccess(discoverMoreContent: anime));
    } catch (e) {
      log("error $e");
      emit(GetDiscoverMoreFailed());
    }
  }
}
