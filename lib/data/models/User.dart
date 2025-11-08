import 'package:json_annotation/json_annotation.dart';

part 'User.g.dart';

@JsonSerializable()
class User {
  late final int id;
  late String username;
  late double XP;
  late int level;
  late Set<int> badgesID;
  late Set<int> customizablesID;

  User({required this.id, required this.username, required this.XP, required this.level, required this.badgesID, required this.customizablesID});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

}