import 'package:json_annotation/json_annotation.dart';
import '../../data/models/Position.dart';

part 'POI.g.dart';

@JsonSerializable()
class POI {
  late final int id;
  late String name;
  late String description;
  late List<String> images;
  late List<int> quizzes;
  late String qrCode;
  late Position position;

  POI({required this.id, required this.name, required this.description, required this.images, required this.quizzes, required this.qrCode, required this.position});

  factory POI.fromJson(Map<String, dynamic> json) => _$POIFromJson(json);

  Map<String, dynamic> toJson() => _$POIToJson(this);

}
