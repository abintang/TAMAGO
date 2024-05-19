import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tamago/core/constants/app_colors.dart';
import 'package:tamago/core/di/dependency_injection.dart';
import 'package:tamago/features/schedule/domain/usecases/get_selected_schedule_anime.dart';
import 'package:tamago/features/schedule/domain/usecases/get_streams_anime.dart';
import 'package:tamago/features/schedule/presentation/bloc/event/schedule_events.dart';
import 'package:tamago/features/schedule/presentation/bloc/state/schedule_state.dart';

class ScheduleBloc extends Bloc<ScheduleEvent, ScheduleState> {
  ScheduleBloc() : super(InitialState()) {
    on<InitialScheduleAnime>(_onLoadInitialSchedule);
    on<LoadScheduleAnime>(_onLoadScheduleAnime);
    on<OnClickedNotifications>(_onClickedNotiications);
  }

  void _onLoadInitialSchedule(
      InitialScheduleAnime event, Emitter<ScheduleState> emit) async {
    emit(LoadingScheduleAnime());
    try {
      final anime = await getIt
          .get<GetSelectedScheduleAnime>()
          .call(DateTime.now().toString());
      final streams = getIt.get<GetStreamsAnime>().insertStreamsAnime(anime);
      emit(
          GetScheduleAnimeSuccess(scheduleAnime: anime, streamsAnime: streams));
    } catch (e) {
      emit(GetScheduleAnimeFailed());
    }
  }

  void _onLoadScheduleAnime(
      LoadScheduleAnime event, Emitter<ScheduleState> emit) async {
    emit(LoadingScheduleAnime());
    try {
      log(event.selectedDate);
      final anime =
          await getIt.get<GetSelectedScheduleAnime>().call(event.selectedDate);
      final streams = getIt.get<GetStreamsAnime>().insertStreamsAnime(anime);
      emit(
          GetScheduleAnimeSuccess(scheduleAnime: anime, streamsAnime: streams));
    } catch (e) {
      log('error');
      emit(GetScheduleAnimeFailed());
    }
  }

  void _onClickedNotiications(
      OnClickedNotifications event, Emitter<ScheduleState> emit) {
    if (event.status == true) {
      emit(GetStatusNotifications(
          icons: Icons.notifications_active,
          backgroundColor: AppColors.primaryColor,
          iconColor: AppColors.secondaryColor));
    } else {
      emit(GetStatusNotifications(
          icons: Icons.notification_add,
          backgroundColor: AppColors.cardBackgroundColor,
          iconColor: AppColors.primaryColor));
    }
  }
}
