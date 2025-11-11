import 'package:re_discover/data/repositories/data_repository_impl/city_repository.dart';
import 'package:re_discover/data/repositories/data_repository_impl/poi_repository.dart';
import 'package:re_discover/data/repositories/data_repository_impl/user_repository.dart';
import 'package:re_discover/domain/models/city.dart';
import 'package:re_discover/domain/models/poi.dart';
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

class RepositoryHub {
  // This class will be responsible for retrieving data from the data layer
  // and providing it to the logic layer.
  static final RepositoryHub _instance = RepositoryHub._internal();

  factory RepositoryHub() => _instance;

  RepositoryHub._internal();

  

  CityRepository cityRepository = CityRepository();
  POIRepository poiRepository = POIRepository();
  UserRepository userRepository = UserRepository();
  // TODO some types are missing
  
 

  Future<List<City>> get cities => cityRepository.data;
  Future<List<POI>> get pois => poiRepository.data;
  Future<List<User>> get users => userRepository.data;
  // TODO some types are missing




}