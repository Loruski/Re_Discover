import 'package:http/http.dart' as http;
import 'package:re_discover/domain/models/user.dart';
import 'dart:convert';


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

  void registerPlayer(User user) async {
    Map<String, dynamic> json = { 
      'id': user.id.toString(),
      'playerId': user.id.toString(),
      'gameId': gameID,
      'state': {}, //TODO
      'levels': [],
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

}