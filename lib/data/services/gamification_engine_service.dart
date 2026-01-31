import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:re_discover/data/models/cosmetic_data.dart';

import 'dart:convert';

import 'package:re_discover/data/models/user_data.dart';
import 'package:re_discover/data/states/city_state.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

const String baseURL = "https://gamification-api.polyglot-edu.com/gamification";

const String modelURL = "$baseURL/model/game/$gameID"; // not to be used

const String gameID = "697d01992657a80217381c9e";

const String playerManagingURL = "$baseURL/data/game/$gameID/player";

const String playerStatusURL = "$baseURL/gengine/state/$gameID";

const String actionExecutionURL = "$baseURL/gengine/execute";

const String badgesURL = "$modelURL/badges";

const String rulesURL = "$modelURL/rules";

final Map<String, String> httpHeaders = {
  'Authorization': ?dotenv.env['API_GAMIFICATION_ENGINE'],
  'Content-Type': 'application/json; charset=UTF-8',
};

class GamificationEngineService {
  static final GamificationEngineService _instance =
      GamificationEngineService._internal();

  factory GamificationEngineService() => _instance;

  GamificationEngineService._internal();

  Future<void> registerPlayer(String user) async {
    final Map<String, dynamic> json = {
      "id": user,
      "playerId": user,
      "gameId": gameID,
      "state": {},
      "levels": [],
      "inventory": {},
      "customData": {},
    };

    final response = await http.post(
      Uri.parse("$playerManagingURL/$user"),
      headers: httpHeaders,
      body: jsonEncode(json),
    );

    if (response.statusCode != 200) {
      log("Error registering player: ${response.statusCode}");
    }

  }

  Future<UserData?> getPlayerState(String user) async {
    final response = await http.get(
      Uri.parse("$playerManagingURL/$user"),
      headers: httpHeaders,
    );

    if (response.statusCode != 200) {
      log("Error getting player state: ${response.statusCode}");
      return null;
    }

    print("GATTO ${response.body}");

    return fromPlayerJson(jsonDecode(response.body));
  }

  void addXp(bool errors, String userId) async {
    String callParameters = errors ? "earn_xp_quiz_errors" : "earn_xp_quiz";

    final Map<String, dynamic> json = {
      "gameId": gameID,
      "actionId": callParameters,
      "playerId": userId,
    };
    final response = await http.post(
      Uri.parse(actionExecutionURL),
      headers: httpHeaders,
      body: jsonEncode(json),
    );
    if (response.statusCode != 200) {
      log("Error adding XP: ${response.statusCode}");
    }
  }

  void deletePlayer(String user) async {
    final response = await http.delete(
      Uri.parse("$playerManagingURL/$user"),
      headers: httpHeaders,
    );
    if (response.statusCode != 200) {
      log("Error deleting player: ${response.statusCode}");
    }
  }

  Future<List<UserData>?> getRegisteredPlayers({int size = 20}) async {
    final response = await http.get(
      Uri.parse("$playerStatusURL?size=$size"),
      headers: httpHeaders,
    );
    // log(response.body);
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      List<dynamic> jsonList = json["content"];

      return jsonList.cast<Map<String, dynamic>>().map(fromPlayerJson).toList();
    } else {
      log("Error getting registered players: ${response.statusCode}");
      return null;
    }
  }

  void _executeAction(
    String user,
    ActionId actionId, {
    Map<String, dynamic> params = const {},
  }) async {
    final Map<String, dynamic> json = {
      "gameId": gameID,
      "actionId": actionId.id,
      "playerId": user,
      "data": params,
    };

    final response = await http.post(
      Uri.parse(actionExecutionURL),
      headers: httpHeaders,
      body: jsonEncode(json),
    );
    if (response.statusCode != 200) {
      log("Error executing action $actionId: ${response.statusCode}");
    }
  }
}

UserData fromPlayerJson(Map<String, dynamic> json) {
  // 1. Estraiamo la lista PointConcept in modo sicuro
  // Se 'state' o 'PointConcept' mancano, pointList sarà null
  final List? pointList = json['state']?['PointConcept'];

  // 2. Cerchiamo l'elemento che ha id == "xp" invece di usare l'indice [2]
  // Questo lo rende immune a cambi di ordine nel JSON
  final xpEntry = pointList?.firstWhere(
        (element) => element['id'] == 'xp',
    orElse: () => null,
  );

  // 3. Estraiamo lo score. Se xpEntry è null (perché state era {}) mettiamo 0.0
  double userXP = (xpEntry?['score'] ?? 0.0).toDouble();

  // 4. Livello: gestiamo il caso in cui 'levels' sia vuoto o nullo
  int userLevel = 1;
  if (json['levels'] != null && (json['levels'] as List).isNotEmpty) {
    userLevel = int.tryParse(json['levels'][0]['levelValue'].toString()) ?? 1;
  }

  return UserData(
    username: json['playerId'] ?? 'Unknown',
    xp: userXP,
    level: userLevel,
    badgesID: {},
    customizablesID: {},
  );
}

enum ActionId {
  earnXp("earn_xp");

  final String id;

  const ActionId(this.id);
}
