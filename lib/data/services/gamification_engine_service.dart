import 'package:http/http.dart' as http;
import 'package:re_discover/data/models/cosmetic_data.dart';

import 'dart:convert';

import 'package:re_discover/data/models/user_data.dart';
import 'package:re_discover/data/states/city_state.dart';


const String baseURL = "https://gamification-api.polyglot-edu.com/gamification";

const String modelURL = "$baseURL/model/game/$gameID"; // not to be used

const String gameID = ""; //TODO

const String playerManagingURL = "$baseURL/data/game/$gameID/player";

const String playerStatusURL = "$baseURL/gengine/state/$gameID";

const String actionExecutionURL = "$baseURL/gengine/execute";



const String badgesURL = "$modelURL/badges";

const String rulesURL = "$modelURL/rules";



class GamificationEngineService {
  static final GamificationEngineService _instance = GamificationEngineService._internal();

  factory GamificationEngineService() => _instance;

  GamificationEngineService._internal();

  void registerPlayer(UserData user) async {
    final Map<String, dynamic> json = { 
      'id': user.id.toString(),
      'playerId': user.id.toString(),
      'gameId': gameID,
      'state': {}, //TODO
      'levels': [{
          "levelName": "XP_level",
          "levelValue": user.xp.toString(), // ???
          "levelIndex": user.level,
          "pointConcept": "xp",
          "startLevelScore": 0, // I don't know what to put here
          "endLevelScore": 0,
          "toNextLevel": 0
      }],
      'inventory': {},
      'customData': {}
    };
    http.post(
    Uri.parse("$playerManagingURL/${user.id.toString()}"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(json),
  );
  }

  void deletePlayer(UserData user) async {
    http.delete(
    Uri.parse("$playerManagingURL/${user.id.toString()}"),
    );
  }

  Future<List<UserData>?> getRegisteredPlayers({int size = 20}) async {
    final response = await http.get(Uri.parse("$playerStatusURL?size=$size"));
    if (response.statusCode == 200) {
      return (jsonDecode(response.body) as Iterable<Map<String, dynamic>>)
        .map(fromPlayerJson).toList();
      
  
  } else {
    return null;
  }
  }

  
  UserData fromPlayerJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'],
      username: json['playerId'],
      xp: json['levels'][0]['levelValue'],
      level: json['levels'][0]['levelIndex'], 
      badgesID: Set(), //TODO NON LO SO
      customizablesID: json['customData']['Customizables'] as Set<int>,
    );
  }

}