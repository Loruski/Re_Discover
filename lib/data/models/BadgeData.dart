import 'package:json_annotation/json_annotation.dart';
import 'package:re_discover/domain/models/Badge.dart' as domain;

part 'BadgeData.g.dart';

@JsonSerializable()
class BadgeData {
  late final int id;
  late String name;
  late String imgPath;

  BadgeData({required this.id, required this.name, required this.imgPath});

  factory BadgeData.fromJson(Map<String, dynamic> json) => _$BadgeDataFromJson(json);

  Map<String, dynamic> toJson() => _$BadgeDataToJson(this);

  domain.Badge toDomain() {
    return domain.Badge(
      id: id,
      name: name,
      imgPath: imgPath,
    );
  }
}