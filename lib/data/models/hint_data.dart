import 'package:json_annotation/json_annotation.dart';

part 'hint_data.g.dart';

@JsonSerializable()
class HintData {
  late final int id;
  late String description;
  late List<String> images;

  HintData({required this.id, required this.description, required this.images});

  factory HintData.fromJson(Map<String, dynamic> json) => _$HintDataFromJson(json);

  Map<String, dynamic> toJson() => _$HintDataToJson(this);
}