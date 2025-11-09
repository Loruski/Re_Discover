import 'package:flutter/foundation.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapViewModel extends ChangeNotifier {
  // insert repository here

  final MapController mapController = MapController();
  LatLng? currentCenter;
  double? currentZoom;

  void updateMapPosition(LatLng center, double zoom) {
    currentCenter = center;
    currentZoom = zoom;
  }


  Future<void> _load() async {
    // load at the first time
    notifyListeners();
  }
}
