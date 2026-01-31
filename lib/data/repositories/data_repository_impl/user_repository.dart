import 'dart:developer';

import 'package:re_discover/data/repositories/static_repo_settings/paths.dart';
import 'package:re_discover/data/repositories/repository_hub.dart';
import 'package:re_discover/data/services/gamification_engine_service.dart';
import 'package:re_discover/domain/models/cosmetic.dart';
import 'package:re_discover/domain/models/user.dart';
import 'package:re_discover/data/models/user_data.dart';
import 'package:re_discover/data/repositories/abstract_data_repository.dart';
import 'package:re_discover/domain/models/badge.dart';
import 'package:re_discover/domain/models/badge.dart' as ReDiscover;
import 'package:shared_preferences/shared_preferences.dart';


class UserRepository extends AbstractDataRepository<UserData, User> {

  UserRepository(): super(
    path: Paths.usersPath,
    updateFunction: GamificationEngineService().getRegisteredPlayers,
    fromJson: UserData.fromJson,
    toJson: (User element) {
      UserData userData = UserData(username: element.username, xp: element.xp, level: element.level, badgesID: element.badges.map((e) => e.id).toSet(), customizablesID: element.customizables.map((e) => e.id).toSet());
      return userData.toJson();
    },
    assignIds: (List<UserData> data, Map<Types, AbstractDataRepository>? requiredData) {

      Map<int, User> toSetToHolder = {};

      if(requiredData == null) log("no required data set to UserRepository!!");

      for(UserData element in data) {

        Set<Badge>? badges = element.badgesID.map((id) => requiredData?[Types.badge]?.get(id)).whereType<Badge>().toSet();

        Set<Cosmetic>? customizables = element.customizablesID.map((id) => requiredData?[Types.customizable]?.get(id)).whereType<Cosmetic>().toSet();


        if (badges.contains(null)) log("in User $UserData.id $UserData.name there's a badge not found in the holder: $badges");
        if (customizables.contains(null)) log("in User $UserData.id $UserData.name there's a customizable not found in the holder: $customizables");

        toSetToHolder[element.username.hashCode] = User(username: element.username, xp: element.xp, level: element.level, badges: badges, customizables: customizables);
      }
      return toSetToHolder;
    }
  );

  Future<void> storeUser(String username) async {
    try {

      await GamificationEngineService().registerPlayer(username);

      UserData? data = await GamificationEngineService().getPlayerState(username);

      if (data == null) {
        log("Error: getPlayerState returned null for $username");
        return;
      }

      print("GATTO: ${data.username}");

      final prefs = await SharedPreferences.getInstance();
      if(prefs.getStringList("user") != null) {
        await prefs.remove("user");
      }

      bool save = await prefs.setStringList("user", [
        data.username.hashCode.toString(),
        data.username,
        data.xp.toString(),
        data.level.toString(),
        "",
        ""
      ]);

      print("Saved user $username: $save");

    } catch (e) {
      log("Error in storeUser: $e");
    }
  }



  void updateUserXp(bool error) async {
    User? user = await getLoggedInUser();
    if(user == null) return;
    GamificationEngineService().addXp(error, user.username);
  }

  
  Future<List<String>?> getTemporaryUser() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList("user");
  }

  Future<User?> getLoggedInUser() async {
    var temporaryUser = await getTemporaryUser();
    var isTemporaryUserNull = temporaryUser == null;

    if (isTemporaryUserNull) return null;

    return User(
        username: temporaryUser[1],
        xp: double.parse(temporaryUser[2]),
        level: int.parse(temporaryUser[3]),
        badges: <ReDiscover.Badge>{},
        customizables: <Cosmetic>{});
  }

}