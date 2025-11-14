import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:provider/provider.dart';
import 'package:re_discover/ui/MAP/view_model/map_view_model.dart';
import 'package:re_discover/ui/MAP/widgets/level_widget.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:re_discover/ui/core/utils.dart';

class OsmCustom extends StatefulWidget {
  const OsmCustom({
    super.key,
    required this.mapController,
    required this.currentPosition,
    required this.updateMapPosition,
    required this.followUserPositionToggle,
  });

  final MapController mapController;
  final LatLng currentPosition;
  final Function(double zoom) updateMapPosition;
  final VoidCallback followUserPositionToggle;
  

  @override
  State<OsmCustom> createState() => _OsmCustomState();
}

class _OsmCustomState extends State<OsmCustom> {
  

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
          Consumer<MapViewModel>(
            builder: (context, viewModel, child) => MarkerLayer(
              markers: [
                //TODO: replace with dynamic POI markers and a for
                Marker(
                  point: viewModel.poiPosition,
                  width: 60,
                  height: 60,
                  rotate: true,
                  child: GestureDetector(
                    onTap: () => onShowModalMap(
                      context: context,
                      distanceNotifier: viewModel.distanceNotifier,
                    ),
                    child: Transform.translate(
                      offset: const Offset(0, -20),
                      child: const Icon(Icons.room, color: Colors.red, size: 40),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Consumer<MapViewModel>(
            builder: (context, mapViewModel, child) => CurrentLocationLayer(
              alignPositionOnUpdate: mapViewModel.isFollowingUser,
              alignDirectionOnUpdate: AlignOnUpdate.never,
              style: LocationMarkerStyle(
                marker: const DefaultLocationMarker(
                  child: Icon(Icons.my_location, color: Colors.blue, size: 3),
                ),
                markerSize: const Size(20, 20),
                markerDirection: MarkerDirection.heading,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: const EdgeInsets.only(right: 20, bottom: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  
                  Consumer<MapViewModel>( // Consumer in order to rebuild only this part if zoom and current position change
                    builder: (context, mapViewModel, child) => FloatingActionButton(
                      onPressed: () => widget.mapController.move(
                        mapViewModel.currentPosition,
                        mapViewModel.currentZoom,
                      ),
                      child: const Icon(Icons.my_location),
                    ),
                  ),
                  const SizedBox(height: 10),
                  FloatingActionButton(
                    onPressed: widget.followUserPositionToggle,
                    child: Consumer<MapViewModel>(
                      builder: (context, mapViewModel, child) {
                        if (mapViewModel.isFollowingUserBool) {
                          return const Icon(Icons.near_me);
                        } else {
                          return const Icon(Icons.near_me_disabled);
                        }
                      },
                    ),
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
