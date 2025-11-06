import 'package:re_discover/domain/models/POI.dart';
import 'package:re_discover/domain/models/Position.dart';

class City{
  final String name;
  final Position position;
  String description;
  List<POI> pois;


  City({required this.name, required this.description, required this.position, required this.pois});
}