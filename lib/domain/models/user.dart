import 'package:re_discover/domain/models/badge.dart' as ReDiscover;
import 'package:re_discover/domain/models/cosmetic.dart';

class User {
  late final int id;
  late String username;
  late double xp;
  late int level;
  late Set<ReDiscover.Badge> badges;
  late Set<Cosmetic> customizables;

  User({required this.id, required this.username, required this.xp, required this.level, required this.badges, required this.customizables});

  @override
    String toString() {
      
      return "id: $id, username: $username, xp: $xp, level: $level, badges: $badges, customizables: $customizables";
    }
}