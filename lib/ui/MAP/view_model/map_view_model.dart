import 'package:flutter/foundation.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:latlong2/latlong.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geolocator/geolocator.dart';

class MapViewModel extends ChangeNotifier {
  // insert repository here
  final MapController mapController = MapController();
  LatLng? currentCenter;
  double? currentZoom;

  AlignOnUpdate isFollowingUser = AlignOnUpdate.always;
  bool isFollowingUserBool = true;

  void followUserPositionToggle(){
    if(isFollowingUserBool){
      isFollowingUser = AlignOnUpdate.never;
      isFollowingUserBool = false;
    } else {
      isFollowingUser = AlignOnUpdate.always;
      isFollowingUserBool = true;
    }
    notifyListeners();
  }

  void updateMapPosition(LatLng center, double zoom) {
    currentCenter = center;
    currentZoom = zoom;
  }

  void getUserPosition() async{
    Position position = await _determinePosition();
    mapController.move(LatLng(position.latitude, position.longitude), this.currentZoom!);
  }


  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  void initState() async {
    var status = await Permission.location.status;
    if (!status.isGranted) {
      await Permission.location.request();
    }
  }


}
