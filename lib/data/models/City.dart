import 'package:json_annotation/json_annotation.dart';

part 'City.g.dart';

@JsonSerializable()
class City{
  late final int id;
  late String name;
  late int positionID;
  late String description;
  late Set<int> poisID;

  City({required this.id, required this.name, required this.description, required this.positionID, required this.poisID});

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);

  Map<String, dynamic> toJson() => _$CityToJson(this);
}