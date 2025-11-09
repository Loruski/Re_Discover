import 'package:json_annotation/json_annotation.dart';
import 'package:re_discover/domain/models/customizable.dart' as domain;

part 'customizable_data.g.dart';

@JsonSerializable()
class CustomizableData {
  late final int id;
  late String name;
  late String imgPath;

  CustomizableData({required this.id, required this.name, required this.imgPath});

  factory CustomizableData.fromJson(Map<String, dynamic> json) => _$CustomizableDataFromJson(json);

  Map<String, dynamic> toJson() => _$CustomizableDataToJson(this);

  domain.Customizable toDomain() {
    return domain.Customizable(
      id: id,
      name: name,
      imgPath: imgPath,
    );
  }
}