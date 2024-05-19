// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_today_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimeTodayModel _$AnimeTodayModelFromJson(Map<String, dynamic> json) =>
    AnimeTodayModel(
      route: json['route'] as String,
      title: json['title'] as String,
      english: json['english'] as String?,
      episodeDate: json['episodeDate'] as String,
      episodeNumber: json['episodeNumber'] as int,
      imageVersionRoute: json['imageVersionRoute'] as String,
      donghua: json['donghua'] as bool,
      airType: json['airType'] as String,
    );

Map<String, dynamic> _$AnimeTodayModelToJson(AnimeTodayModel instance) =>
    <String, dynamic>{
      'route': instance.route,
      'title': instance.title,
      'english': instance.english,
      'episodeDate': instance.episodeDate,
      'episodeNumber': instance.episodeNumber,
      'imageVersionRoute': instance.imageVersionRoute,
      'donghua': instance.donghua,
      'airType': instance.airType,
    };
