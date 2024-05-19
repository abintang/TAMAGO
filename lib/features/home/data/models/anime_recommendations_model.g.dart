// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_recommendations_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimeRecommendations _$AnimeRecommendationsFromJson(
        Map<String, dynamic> json) =>
    AnimeRecommendations(
      route: json['route'] as String,
      title: json['title'] as String,
      status: json['status'] as String?,
      episodes: json['episodes'] as int?,
      imageVersionRoute: json['imageVersionRoute'] as String,
      names: NamesModel.fromJson(json['names'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AnimeRecommendationsToJson(
        AnimeRecommendations instance) =>
    <String, dynamic>{
      'route': instance.route,
      'title': instance.title,
      'episodes': instance.episodes,
      'status': instance.status,
      'imageVersionRoute': instance.imageVersionRoute,
      'names': instance.names,
    };
