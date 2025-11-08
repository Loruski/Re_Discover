import 'package:re_discover/data/models/POI.dart';
import 'package:re_discover/domain/models/Position.dart';

class City{
  late final int id;
  late String name;
  late Position position;
  late String description;
  late Set<POI> poisID;


  City({required this.id, required this.name, required this.description, required this.position, required this.poisID});
}