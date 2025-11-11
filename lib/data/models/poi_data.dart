import 'package:json_annotation/json_annotation.dart';
import '../../data/models/position_data.dart';

part 'poi_data.g.dart';

@JsonSerializable()
class POIData {
  late final int id;
  late String name;
  late String description;
  late List<int> imagesId;
  late List<int> quizzesId;
  late String qrCode;
  late int positionId;

  POIData({required this.id, required this.name, required this.description, required this.imagesId, required this.quizzesId, required this.qrCode, required this.positionId});

  factory POIData.fromJson(Map<String, dynamic> json) => _$POIDataFromJson(json);

  Map<String, dynamic> toJson() => _$POIDataToJson(this);

}
