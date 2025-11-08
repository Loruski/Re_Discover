import 'package:json_annotation/json_annotation.dart';

part 'Position.g.dart';

@JsonSerializable()
class Position {
  late final int id ;
  late final double latitude;
  late final double longitude;

  Position({required this.id, required this.latitude, required this.longitude});

  factory Position.fromJson(Map<String, dynamic> json) => _$PositionFromJson(json);

  Map<String, dynamic> toJson() => _$PositionToJson(this);
}