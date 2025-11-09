import 'package:re_discover/data/models/CityData.dart';
import 'package:re_discover/data/models/listenable_data_holder.dart';
import 'package:re_discover/data/repositories/data_handler.dart';
import 'package:re_discover/domain/models/City.dart' show City;
import 'package:re_discover/domain/models/POI.dart';
import 'package:re_discover/domain/models/Position.dart';
import 'package:re_discover/domain/models/Quiz.dart' show Quiz;
import 'package:re_discover/domain/models/Badge.dart' show Badge;
import 'package:re_discover/domain/models/Customizable.dart' show Customizable;
import 'package:re_discover/domain/models/Hint.dart' show Hint;
import 'package:re_discover/domain/models/User.dart';




class DataRepository {
  // This class will be responsible for retrieving data from the data layer
  // and providing it to the logic layer.
  ListenableDataHolder<City> citiesHolder = ListenableDataHolder<City>();
  ListenableDataHolder<POI> poisHolder = ListenableDataHolder<POI>();
  ListenableDataHolder<Quiz> quizzesHolder = ListenableDataHolder<Quiz>();
  ListenableDataHolder<Badge> badgesHolder = ListenableDataHolder<Badge>();
  ListenableDataHolder<Customizable> customizablesHolder = ListenableDataHolder<Customizable>();
  ListenableDataHolder<Hint> hintsHolder = ListenableDataHolder<Hint>();
  ListenableDataHolder<User> usersHolder = ListenableDataHolder<User>();
  ListenableDataHolder<Position> positionsHolder = ListenableDataHolder<Position>();
  // TODO some types are missing


  Future<List<T>> _getData<T> (T Function(Map<String, dynamic>) fromJson) async {
    DataHandler<T> dataHandler = DataHandler<T>(fromJson: fromJson);
    return await dataHandler.bakeDataModels();
  }   


  Future<List<City>> get cities async { 
    while (citiesHolder.data.isEmpty) {
      _updateCities(citiesHolder);
    }

    return citiesHolder.data.values.toList();
  }
  
  List<POI> get pois => poisHolder.data.values.toList();
  List<Quiz> get quizzes => quizzesHolder.data.values.toList();
  List<Badge> get badges => badgesHolder.data.values.toList();
  List<Customizable> get customizables => customizablesHolder.data.values.toList();
  List<Hint> get hints => hintsHolder.data.values.toList();
  List<User> get users => usersHolder.data.values.toList();


// Maybe a generic update function was possible, but mapping IDs to objects for each type made it non-trivial to develop, so there you go
  void _updateCities(ListenableDataHolder<City> holderToBeUpdated) async {
    List<CityData> data = await _getData<CityData>((json) => CityData.fromJson(json));

    Map<int, City> _toSetToHolder = {};

    // updatePositions(positionsHolder); TODO
    // updatePois(poisHolder); TODO
    data.forEach((element) {

      int id = element.id;
      String name = element.name;
      String description = element.description;
      Position position = positionsHolder.data[id]!;
      Set<POI> pois = element.poisID.map((id) => poisHolder.data[id]!).toSet(); 

      _toSetToHolder[element.id] = City(id: id, name: name, description: description, position: position, pois: pois);
    });
    holderToBeUpdated.setData(_toSetToHolder);

  } 
  // TODO Now an update function for each type. HAVE FUN! 
  
}