import '../../domain/models/city.dart';

class Visit {
  late City city;
  late Map<dynamic, bool> visitedPOIs;

  Visit({required this.city, required this.visitedPOIs});
}