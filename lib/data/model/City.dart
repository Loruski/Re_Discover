import 'package:re_discover/domain/models/POI.dart';
import 'package:re_discover/domain/models/Position.dart';

class City{
  final int id;
  final String name;
  int IDposition;
  String description;
  Set<int> pois;

  City({required this.id,required this.name, required this.description, required this.IDposition, required this.pois});

  City.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        name = json['name'] as String,
        description = json['description'] as String,
        IDposition = json['IDposition'] as int,
        pois = Set<int>.from(json['pois'] as Set);

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'IDposition': IDposition,
        'pois': pois,
  };
}