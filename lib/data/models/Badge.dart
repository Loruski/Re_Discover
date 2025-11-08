import 'package:json_annotation/json_annotation.dart';
import 'package:re_discover/domain/models/Badge.dart' as domain;

part 'Badge.g.dart';

@JsonSerializable()
class Badge {
  late final int id;
  late String name;
  late String imgPath;

  Badge({required this.id, required this.name, required this.imgPath});

  factory Badge.fromJson(Map<String, dynamic> json) => _$BadgeFromJson(json);

  Map<String, dynamic> toJson() => _$BadgeToJson(this);

  domain.Badge toDomain() {
    return domain.Badge(
      id: id,
      name: name,
      imgPath: imgPath,
    );
  }
}