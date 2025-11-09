import 'package:json_annotation/json_annotation.dart';

part 'UserData.g.dart';

@JsonSerializable()
class UserData {
  late final int id;
  late String username;
  late double XP;
  late int level;
  late Set<int> badgesID;
  late Set<int> customizablesID;

  UserData({required this.id, required this.username, required this.XP, required this.level, required this.badgesID, required this.customizablesID});

  factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);

}