import 'package:flutter/material.dart';
import 'package:tamago/features/schedule/domain/entities/anime_schedule_entity.dart';
import 'package:tamago/features/schedule/domain/entities/streams_entity.dart';

abstract class ScheduleState {}

class InitialState extends ScheduleState {}

class LoadingScheduleAnime extends ScheduleState {}

class GetScheduleAnimeSuccess extends ScheduleState {
  final List<AnimeScheduleEntity> scheduleAnime;
  final List<StreamsEntity> streamsAnime;

  GetScheduleAnimeSuccess(
      {required this.scheduleAnime, required this.streamsAnime});
}

class GetScheduleAnimeFailed extends ScheduleState {}

class GetStatusNotifications extends ScheduleState {
  final IconData icons;
  final Color backgroundColor;
  final Color iconColor;

  GetStatusNotifications(
      {required this.icons,
      required this.backgroundColor,
      required this.iconColor});
}
