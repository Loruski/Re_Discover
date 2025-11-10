import 'dart:async';
import 'dart:developer';

import 'package:re_discover/data/models/city_data.dart';
import 'package:re_discover/data/models/listenable_data_holder.dart';
import 'package:re_discover/data/models/poi_data.dart';
import 'package:re_discover/data/models/position_data.dart';
import 'package:re_discover/data/models/quiz_data.dart';
import 'package:re_discover/data/repositories/data/city_repository.dart';
import 'package:re_discover/data/repositories/data_handler.dart';
import 'package:re_discover/domain/models/city.dart' show City;
import 'package:re_discover/domain/models/poi.dart';
import 'package:re_discover/domain/models/position.dart';
import 'package:re_discover/domain/models/quiz.dart' show Quiz;
import 'package:re_discover/domain/models/badge.dart' show Badge;
import 'package:re_discover/domain/models/customizable.dart' show Customizable;
import 'package:re_discover/domain/models/hint.dart' show Hint;
import 'package:re_discover/domain/models/user.dart';


enum Types {
  city,
  poi,
  quiz,
  badge,
  customizable,
  hint,
  user,
  position,
  appSkin,
  visit
}

class CentralRepository {
  // This class will be responsible for retrieving data from the data layer
  // and providing it to the logic layer.
  static final CentralRepository _instance = CentralRepository._internal();

  factory CentralRepository() => _instance;

  CentralRepository._internal();

  

  // CityRepository cityRepository = CityRepository(requiredData: {Types.poi: }); //TODO
  // TODO some types are missing
  
 

  // Future<List<City>> get cities => cityRepository.data;

  

}