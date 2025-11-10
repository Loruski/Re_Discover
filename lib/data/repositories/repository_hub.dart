import 'package:re_discover/data/repositories/data_repository_impl/city_repository.dart';
import 'package:re_discover/domain/models/city.dart';

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

  

  CityRepository cityRepository = CityRepository(); //TODO
  // TODO some types are missing
  
 

  Future<List<City>> get cities => cityRepository.data;


}