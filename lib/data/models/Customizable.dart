import 'package:json_annotation/json_annotation.dart';
import 'package:re_discover/domain/models/Customizable.dart' as domain;

part 'Customizable.g.dart';

@JsonSerializable()
class Customizable {
  late final int id;
  late String name;
  late String imgPath;

  Customizable({required this.id, required this.name, required this.imgPath});

  factory Customizable.fromJson(Map<String, dynamic> json) => _$CustomizableFromJson(json);

  Map<String, dynamic> toJson() => _$CustomizableToJson(this);

  domain.Customizable toDomain() {
    return domain.Customizable(
      id: id,
      name: name,
      imgPath: imgPath,
    );
  }
}