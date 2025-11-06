import 'package:re_discover/domain/models/Badge.dart' as ReDiscover;
import 'package:re_discover/domain/models/Customizable.dart';

class User {
  late final int id;
  late String username;
  late double XP;
  late int level;
  late Set<int> IDbadges;
  late Set<int> IDcustomizables;

  User({required this.id,required this.username,required this.XP,required this.level,required this.IDbadges,required this.IDcustomizables});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    XP = json['XP'];
    level = json['level'];
    IDbadges = Set<int>.from(json['IDbadges']);
    IDcustomizables = Set<int>.from(json['IDcustomizables']);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'username': username,
        'XP': XP,
        'level': level,
        'IDbadges': IDbadges.toSet(),
        'IDcustomizables': IDcustomizables.toSet(),
      };
}