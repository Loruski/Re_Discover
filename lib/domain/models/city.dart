import 'package:re_discover/domain/models/poi.dart';
import 'package:re_discover/domain/models/position.dart';

class City{
  late final int id;
  late String name;
  late Position? position;
  late String description;
  late Set<POI>? pois;


  City({required this.id, required this.name, required this.description, required this.position, required this.pois});
}