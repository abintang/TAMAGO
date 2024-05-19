// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StreamsModel _$StreamsModelFromJson(Map<String, dynamic> json) => StreamsModel(
      youtube: json['youtube'] as String?,
      crunchyroll: json['crunchyroll'] as String?,
      hulu: json['hulu'] as String?,
      netflix: json['netflix'] as String?,
      funimation: json['funimation'] as String?,
      amazon: json['amazon'] as String?,
      hidive: json['hidive'] as String?,
      wakanim: json['wakanim'] as String?,
    );

Map<String, dynamic> _$StreamsModelToJson(StreamsModel instance) =>
    <String, dynamic>{
      'youtube': instance.youtube,
      'crunchyroll': instance.crunchyroll,
      'hulu': instance.hulu,
      'netflix': instance.netflix,
      'funimation': instance.funimation,
      'amazon': instance.amazon,
      'hidive': instance.hidive,
      'wakanim': instance.wakanim,
    };
