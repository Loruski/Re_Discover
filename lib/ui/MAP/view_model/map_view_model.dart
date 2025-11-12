import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';

class MapViewModel extends ChangeNotifier {
  // insert repository here
  final MapController mapController = MapController();
  LatLng currentPosition = LatLng(0, 0);
  late double currentZoom = 15.0;
  AlignOnUpdate isFollowingUser = AlignOnUpdate.always;
  bool isFollowingUserBool = true;

  final LocationSettings locationSettings = LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 0,
  );

  StreamSubscription<Position>? positionStream;
  void initLocationStream() => positionStream =
      Geolocator.getPositionStream(locationSettings: locationSettings).listen( (
        Position? position,
      ) {
        log(
          position == null
              ? 'Unknown'
              : 'stream ${position.latitude.toString()}, ${position.longitude.toString()}',
        );
        if(position!=null){
          currentPosition = LatLng(position.latitude, position.longitude);
          notifyListeners();
        }
      });

  void followUserPositionToggle() {
    if (isFollowingUserBool) {
      isFollowingUser = AlignOnUpdate.never;
      isFollowingUserBool = false;
    } else {
      isFollowingUser = AlignOnUpdate.always;
      isFollowingUserBool = true;
    }
    notifyListeners();
  }

  void updateZoomLevel(double zoom) {
    currentZoom = zoom;
    notifyListeners();
  }

  void getUserPosition() async {
    // bool permissionGranted = await checkLocationPermission();
    // if (!permissionGranted) return;
    // Position position = await _determinePosition();
    mapController.move(
      LatLng(currentPosition.latitude, currentPosition.longitude),
      currentZoom,
    );
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
        'Location permissions are permanently denied, we cannot request permissions.',
      );
    }
  
    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
     initLocationStream();
    return await Geolocator.getCurrentPosition();
  }

  void initState() async {
    //Position position = await _determinePosition();
    await _determinePosition();
    //currentPosition = LatLng(position.latitude, position.longitude);
  }
}


