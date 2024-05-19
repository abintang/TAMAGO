import 'package:json_annotation/json_annotation.dart';
part 'sub_model.g.dart';

@JsonSerializable(includeIfNull: true)
class StreamsModel {
  @JsonKey(includeIfNull: true)
  String? youtube;
  @JsonKey(includeIfNull: true)
  String? crunchyroll;
  @JsonKey(includeIfNull: true)
  String? hulu;
  @JsonKey(includeIfNull: true)
  String? netflix;
  @JsonKey(includeIfNull: true)
  String? funimation;
  @JsonKey(includeIfNull: true)
  String? amazon;
  @JsonKey(includeIfNull: true)
  String? hidive;
  @JsonKey(includeIfNull: true)
  String? wakanim;

  StreamsModel(
      {required this.youtube,
      required this.crunchyroll,
      required this.hulu,
      required this.netflix,
      required this.funimation,
      required this.amazon,
      required this.hidive,
      required this.wakanim});

  factory StreamsModel.fromJson(Map<String, dynamic> json) =>
      _$StreamsModelFromJson(json);

  Map<String, dynamic> toJson() => _$StreamsModelToJson(this);
}
