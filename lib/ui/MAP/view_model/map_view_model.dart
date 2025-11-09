import 'package:flutter/foundation.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:permission_handler/permission_handler.dart';

class MapViewModel extends ChangeNotifier {
  // insert repository here

  final MapController mapController = MapController();
  LatLng? currentCenter;
  double? currentZoom;



  void updateMapPosition(LatLng center, double zoom) {
    currentCenter = center;
    currentZoom = zoom;
  }

  void initState() async {
    var status = await Permission.location.status;
    if (!status.isGranted) {
      await Permission.location.request();
    }
  }


}
