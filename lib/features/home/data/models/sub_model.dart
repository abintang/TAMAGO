import 'package:json_annotation/json_annotation.dart';
part 'sub_model.g.dart';

@JsonSerializable()
class NamesModel {
  String english;

  NamesModel({String? english}) : english = english ?? "";

  factory NamesModel.fromJson(Map<String, dynamic> json) =>
      _$NamesModelFromJson(json);

  Map<String, dynamic> toJson() => _$NamesModelToJson(this);
}
