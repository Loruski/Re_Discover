import 'package:json_annotation/json_annotation.dart';

part 'VisitData.g.dart';

@JsonSerializable()
class VisitData {
  late int cityID;
  late Map<int, bool> visitedPOIs;

  VisitData({required this.cityID, required this.visitedPOIs});

  factory VisitData.fromJson(Map<String, dynamic> json) => _$VisitDataFromJson(json);

  Map<String, dynamic> toJson() => _$VisitDataToJson(this);
}