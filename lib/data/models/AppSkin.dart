import 'package:json_annotation/json_annotation.dart';
import 'package:re_discover/domain/models/AppSkin.dart' as domain;

part 'AppSkin.g.dart';

@JsonSerializable()
class AppSkin {
  late final int id;
  late String skinPath;

  AppSkin({required this.id, required this.skinPath});

  factory AppSkin.fromJson(Map<String, dynamic> json) => _$AppSkinFromJson(json);

  Map<String, dynamic> toJson() => _$AppSkinToJson(this);

  domain.AppSkin toDomain() {
    return domain.AppSkin(
      id: id,
      skinPath: skinPath,
    );
  }
}