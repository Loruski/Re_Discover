import 'package:json_annotation/json_annotation.dart';

part 'Hint.g.dart';

@JsonSerializable()
class Hint {
  late final int id;
  late String description;
  late List<String> images;

  Hint({required this.id, required this.description, required this.images});

  factory Hint.fromJson(Map<String, dynamic> json) => _$HintFromJson(json);

  Map<String, dynamic> toJson() => _$HintToJson(this);
}