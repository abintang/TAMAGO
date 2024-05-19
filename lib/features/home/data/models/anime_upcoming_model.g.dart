// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_upcoming_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimeUpcomingModel _$AnimeUpcomingModelFromJson(Map<String, dynamic> json) =>
    AnimeUpcomingModel(
      route: json['route'] as String,
      title: json['title'] as String,
      premier: json['premier'] as String,
      month: json['month'] as String?,
      year: json['year'] as int?,
      jpnTime: json['jpnTime'] as String,
      imageVersionRoute: json['imageVersionRoute'] as String,
      names: NamesModel.fromJson(json['names'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AnimeUpcomingModelToJson(AnimeUpcomingModel instance) =>
    <String, dynamic>{
      'route': instance.route,
      'title': instance.title,
      'premier': instance.premier,
      'month': instance.month,
      'year': instance.year,
      'jpnTime': instance.jpnTime,
      'imageVersionRoute': instance.imageVersionRoute,
      'names': instance.names,
    };
