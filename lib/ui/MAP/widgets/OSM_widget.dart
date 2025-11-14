import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:re_discover/ui/MAP/widgets/level_widget.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:re_discover/ui/core/utils.dart';

class OsmCustom extends StatefulWidget {
  const OsmCustom({
    super.key,
    required this.mapController,
    required this.currentPosition,
    required this.currentZoom,
    required this.updateMapPosition,
    required this.isFollowingUser,
    required this.followUserPositionToggle,
    required this.isFollowingUserBool,
  });

  final MapController mapController;
  final LatLng currentPosition;
  final double currentZoom;
  final Function(double zoom) updateMapPosition;
  final AlignOnUpdate isFollowingUser;
  final VoidCallback followUserPositionToggle;
  final bool isFollowingUserBool;

  @override
  State<OsmCustom> createState() => _OsmCustomState();
}

class _OsmCustomState extends State<OsmCustom> {
  late ValueNotifier<double> distanceNotifier;
  final LatLng poiPosition = LatLng(42.356357865311004, 13.388983714794294);


  @override
  void initState() {
    super.initState();
    distanceNotifier = ValueNotifier<double>(
      Geolocator.distanceBetween(
      widget.currentPosition.latitude,
      widget.currentPosition.longitude,
      poiPosition.latitude,
      poiPosition.longitude,
      )
    );
  }
  
  @override
  void didUpdateWidget(OsmCustom oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentPosition != widget.currentPosition) {
      _updateDistance();
    }
  }

  void _updateDistance() {
    final newDistance = Geolocator.distanceBetween(
      widget.currentPosition.latitude,
      widget.currentPosition.longitude,
      poiPosition.latitude,
      poiPosition.longitude,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        distanceNotifier.value = newDistance;
        print('Distance updated: ${distanceNotifier.value}');
      }
    });
  }

  @override
  void dispose() {
    distanceNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return Expanded(
      child: FlutterMap(
        mapController: widget.mapController,
        options: MapOptions(
          initialCenter: widget.currentPosition,
          onPositionChanged: (position, hasGesture) {
            widget.updateMapPosition(position.zoom);
          },
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'it.univaq.egs.re_discover',
          ),
          MarkerLayer(
            markers: [
              //TODO: replace with dynamic POI markers and a for
              Marker(
                point: poiPosition,
                width: 60,
                height: 60,
                rotate: true,
                child: GestureDetector(
                  onTap: () => onShowModalMap(
                    context: context,
                    distanceNotifier: distanceNotifier,
                  ),
                  child: Transform.translate(
                    offset: const Offset(0, -20),
                    child: const Icon(Icons.room, color: Colors.red, size: 40),
                  ),
                ),
              ),
            ],
          ),
          CurrentLocationLayer(
            alignPositionOnUpdate: widget.isFollowingUser,
            alignDirectionOnUpdate: AlignOnUpdate.never,
            style: LocationMarkerStyle(
              marker: const DefaultLocationMarker(
                child: Icon(Icons.my_location, color: Colors.blue, size: 3),
              ),
              markerSize: const Size(20, 20),
              markerDirection: MarkerDirection.heading,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: const EdgeInsets.only(right: 20, bottom: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FloatingActionButton(
                    onPressed: () => widget.mapController.move(
                      widget.currentPosition,
                      widget.currentZoom,
                    ),
                    child: const Icon(Icons.my_location),
                  ),
                  const SizedBox(height: 10),
                  FloatingActionButton(
                    onPressed: widget.followUserPositionToggle,
                    child: () {
                      if (widget.isFollowingUserBool) {
                        return const Icon(Icons.near_me);
                      } else {
                        return const Icon(Icons.near_me_disabled);
                      }
                    }(),
                  ),
                ],
              ),
            ),
          ),
          Align(alignment: Alignment.topCenter, child: LevelWidget()),
        ],
      ),
    );
  }
}
