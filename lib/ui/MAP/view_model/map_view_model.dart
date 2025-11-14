import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class MapViewModel extends ChangeNotifier {
  // insert repository here
  final MapController mapController = MapController();
  LatLng currentPosition = LatLng(0, 0);
  late double currentZoom = 15.0;
  AlignOnUpdate isFollowingUser = AlignOnUpdate.always;
  bool isFollowingUserBool = true;
  bool gainedInitialPosition = false;

  final LocationSettings locationSettings = LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 0,
  );

  StreamSubscription<Position>? positionStream;
  void initLocationStream() => positionStream =
      Geolocator.getPositionStream(locationSettings: locationSettings).listen((
        Position? position,
      ) {
        log(
          position == null
              ? 'Unknown'
              : 'stream ${position.latitude.toString()}, ${position.longitude.toString()}',
        );
        print("stream updated");
        if (position != null) {
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

  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black54,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  Future<void> _determinePermissions() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('------- Location services are disabled. -------');
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
        return Future.error('------- Location permissions are denied -------');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.

      showToast("Permission denied forever ");

      return Future.error(
        '------- Location permissions are permanently denied, we cannot request permissions. -------',
      );
    }
  }


  Future<bool> _waitForPermissionGrant({Duration timeout = const Duration(seconds: 15)}) async {
    final end = DateTime.now().add(timeout);
    while (DateTime.now().isBefore(end)) {
      if (await Permission.location.isGranted) return true;
      await Future.delayed(const Duration(milliseconds: 500));
    }
    return false;
  }

  Future<Position> initialPosition() async {
    return await Geolocator.getCurrentPosition();
  }

  Future<void> initState() async {
    print("init 1");
    final status = await Permission.location.request();
    print("init 2 - status: $status");

    if (!status.isGranted) {
      final granted = await _waitForPermissionGrant();
      if (!granted) {
        showToast("Permesso posizione non concesso");
        return;
      }
    }

    // ora che il permesso è garantito, avvia lo stream e prendi la posizione iniziale
    initLocationStream();

    try {
      final pos = await initialPosition();
      currentPosition = LatLng(pos.latitude, pos.longitude);
      gainedInitialPosition = true;
      notifyListeners();
      print("init6: posizione ottenuta ${currentPosition.latitude}, ${currentPosition.longitude}");
    } catch (e, s) {
      print("Impossibile ottenere la posizione iniziale: $e\n$s");
      showToast("Impossibile ottenere la posizione iniziale");
    }
  }

}
