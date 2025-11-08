import 'package:json_annotation/json_annotation.dart';

part 'Visit.g.dart';

@JsonSerializable()
class Visit {
  late int cityID;
  late Map<int, bool> visitedPOIs;

  Visit({required this.cityID, required this.visitedPOIs});

  factory Visit.fromJson(Map<String, dynamic> json) => _$VisitFromJson(json);

  Map<String, dynamic> toJson() => _$VisitToJson(this);
}