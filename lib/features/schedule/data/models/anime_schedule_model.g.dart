// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_schedule_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimeScheduleModel _$AnimeScheduleModelFromJson(Map<String, dynamic> json) =>
    AnimeScheduleModel(
      route: json['route'] as String,
      title: json['title'] as String,
      english: json['english'] as String?,
      episodeDate: json['episodeDate'] as String,
      episodeNumber: json['episodeNumber'] as int,
      episodes: json['episodes'] as int?,
      imageVersionRoute: json['imageVersionRoute'] as String,
      donghua: json['donghua'] as bool,
      streams: StreamsModel.fromJson(json['streams'] as Map<String, dynamic>),
      airType: json['airType'] as String,
    );

Map<String, dynamic> _$AnimeScheduleModelToJson(AnimeScheduleModel instance) =>
    <String, dynamic>{
      'route': instance.route,
      'title': instance.title,
      'english': instance.english,
      'episodeDate': instance.episodeDate,
      'episodeNumber': instance.episodeNumber,
      'episodes': instance.episodes,
      'imageVersionRoute': instance.imageVersionRoute,
      'donghua': instance.donghua,
      'airType': instance.airType,
      'streams': instance.streams,
    };
