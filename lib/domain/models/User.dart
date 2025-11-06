import 'package:re_discover/domain/models/Badge.dart' as ReDiscover;
import 'package:re_discover/domain/models/Customizable.dart';

class User {
  late final int id;
  late String username;
  late double XP;
  late int level;
  late Set<ReDiscover.Badge> badges;
  late Set<Customizable> customizables;

  User({required this.id,required this.username,required this.XP,required this.level,required this.badges,required this.customizables});
}