import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:re_discover/ui/MAP/widgets/POI_modal_bottom_sheet.dart';
import 'package:re_discover/ui/MAP/widgets/level_widget.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:re_discover/ui/core/utils.dart';

class OsmCustom extends StatelessWidget {
  const OsmCustom({super.key, required this.mapController, required this.currentCenter, required this.currentZoom, required this.updateMapPosition, required this.isFollowingUser, required this.getUserPosition, required this.followUserPositionToggle, required this.isFollowingUserBool});

  final MapController mapController;
  final LatLng? currentCenter;
  final double? currentZoom;
  final Function(LatLng center, double zoom) updateMapPosition;
  final AlignOnUpdate isFollowingUser;
  final VoidCallback getUserPosition;
  final VoidCallback followUserPositionToggle;
  final bool isFollowingUserBool;


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FlutterMap(
        mapController: mapController,
        options: MapOptions(
          initialCenter:
          currentCenter ??
              const LatLng(42.405916, 12.856193),
          onPositionChanged: (position, hasGesture) {
            updateMapPosition(
              position.center,
              position.zoom,
            );
          },
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'it.univaq.egs.re_discover',
          ),
          CurrentLocationLayer(
            alignPositionOnUpdate: isFollowingUser,
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
                    onPressed: getUserPosition,
                    child: const Icon(Icons.my_location),
                  ),
                  const SizedBox(height: 10),
                  FloatingActionButton(
                    onPressed: followUserPositionToggle,
                    child: () {
                      if (isFollowingUserBool) {
                        return const Icon(Icons.near_me);
                      } else {
                        return const Icon(Icons.near_me_disabled);
                      }
                    }(),
                  ),
                  FloatingActionButton(onPressed: () => onShowModal(context, PoiModalBottomSheet() ))
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: LevelWidget(),
          ),
        ],
      ),
    );
  }
}
