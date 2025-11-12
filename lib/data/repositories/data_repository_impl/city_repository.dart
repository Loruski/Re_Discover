import 'dart:developer';
import 'package:re_discover/data/models/city_data.dart';
import 'package:re_discover/data/repositories/paths/paths.dart';
import 'package:re_discover/data/repositories/repository_hub.dart';
import 'package:re_discover/data/repositories/abstract_data_repository.dart';
import 'package:re_discover/domain/models/city.dart';
import 'package:re_discover/domain/models/poi.dart';
import 'package:re_discover/domain/models/position.dart';

class CityRepository extends AbstractDataRepository<CityData, City> {
  CityRepository(): super(
    path: Paths.citiesPath,
    fromJson: CityData.fromJson, // assign its fromJson function
    assignIds: (List<CityData> data, Map<Types, AbstractDataRepository>? requiredData) { //assign the method of assigning IDs

      Map<int, City> toSetToHolder = {}; //the data to set goes here

      if(requiredData == null) log("no required data set to CityRepository!!"); // city requires other objects in order to be built

      for (CityData element in data) {

        Position? position = requiredData?[Types.position]?.get(element.positionID); //map the id to the position object
        Set<POI>? pois = element.poisID.map((id) => requiredData?[Types.poi]?.get(id)).whereType<POI>().toSet(); // same here but in a set

        // in case some data is not found, continue regardless but alert
        if (position == null) log("in City $CityData.id $CityData.name the position was not found in the holder");
        if (pois.contains(null)) log("in City $CityData.id $CityData.name there's a POI not found in the holder: $pois");

        toSetToHolder[element.id] = City(id: element.id, name: element.name, description: element.description, position: position, pois: pois); // set to the key id the corresponding object
      }
      return toSetToHolder;
    }
  );
}
