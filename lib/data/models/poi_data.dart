import 'package:json_annotation/json_annotation.dart';
import '../../data/models/position_data.dart';

part 'poi_data.g.dart';

@JsonSerializable()
class POIData {
  late final int id;
  late String name;
  late String description;
  late List<String> images;
  late List<int> quizzes;
  late String qrCode;
  late PositionData position;

  POIData({required this.id, required this.name, required this.description, required this.images, required this.quizzes, required this.qrCode, required this.position});

  factory POIData.fromJson(Map<String, dynamic> json) => _$POIDataFromJson(json);

  Map<String, dynamic> toJson() => _$POIDataToJson(this);

}
