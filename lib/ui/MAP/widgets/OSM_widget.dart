import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:provider/provider.dart';
import 'package:re_discover/domain/models/city.dart';
import 'package:re_discover/domain/models/poi.dart';
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
    required this.allCities,
    required this.poisOfSelectedCity,
    required this.isVisiting,
    required this.poiToUnlock,
  });

  final MapController mapController;
  final LatLng currentPosition;
  final Function(double zoom) updateMapPosition;
  final VoidCallback followUserPositionToggle;
  final List<City> allCities;
  final List<POI> poisOfSelectedCity;
  final bool isVisiting;
  final POI? poiToUnlock;

  @override
  State<OsmCustom> createState() => _OsmCustomState();
}

class _OsmCustomState extends State<OsmCustom> {
  @override
  Widget build(BuildContext context) {

    List<Marker> cityMarkers(List<City> cities) {
      return cities.map((city) {
        final lat = city.position.latitude;
        final lng = city.position.longitude;

        return Marker(
          point: LatLng(lat, lng),
          width: 40,
          height: 40,
          rotate: true,
          child: GestureDetector(
            onTap: () => onShowModalCity(context: context, city: city),
            child: Transform.translate(
              offset: const Offset(0, -10),
              child: const Icon(Icons.location_city_rounded, color: Colors.black, size: 20),
            ),
          ),
        );
      }).toList();
    }


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
          Consumer<MapViewModel>(
            builder: (context, viewModel, child) {
              List<Marker> markers = widget.isVisiting && widget.poiToUnlock != null
                  ? [
                      Marker(
                        point: LatLng(widget.poiToUnlock!.position.latitude, widget.poiToUnlock!.position.longitude),
                        width: 60,
                        height: 60,
                        rotate: true,
                        child: GestureDetector(
                          onTap: () => onShowModalMap(
                            context: context,
                            distanceNotifier: viewModel.distanceNotifier,
                            poi: widget.poiToUnlock!,
                          ),
                          child: Transform.translate(
                            offset: const Offset(0, -20),
                            child: const Icon(
                              Icons.room,
                              color: Colors.red,
                              size: 40,
                            ),
                          ),
                        ),
                      ),
                    ]
                  : widget.isVisiting ? [] : cityMarkers(widget.allCities);

              return MarkerLayer(markers: markers);
            },
          ),
          // builder: (context, viewModel, child) => MarkerLayer(
          //   markers: mapMarkers,
          // markers: [
          //   //TODO: replace with dynamic POI markers and a for
          //   Marker(
          //     point: widget.poiPosition,
          //     width: 60,
          //     height: 60,
          //     rotate: true,
          //     child: GestureDetector(
          //       onTap: () => onShowModalMap(
          //         context: context,
          //         distanceNotifier: viewModel.distanceNotifier,
          //       ),
          //       child: Transform.translate(
          //         offset: const Offset(0, -20),
          //         child: const Icon(Icons.room, color: Colors.red, size: 40),
          //       ),
          //     ),
          //   ),
          // ],
          //   ),
          // ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: const EdgeInsets.only(right: 20, bottom: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Consumer<MapViewModel>(
                    // Consumer in order to rebuild only this part if zoom and current position change
                    builder: (context, mapViewModel, child) =>
                        FloatingActionButton(
                          heroTag: null,
                          onPressed: () => widget.mapController.move(
                            mapViewModel.currentPosition,
                            mapViewModel.currentZoom,
                          ),
                          child: const Icon(Icons.my_location),
                        ),
                  ),
                  const SizedBox(height: 10),
                  FloatingActionButton(
                    heroTag: null,
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
          if (widget.isVisiting)
            Align(alignment: Alignment.topCenter, child: LevelWidget()),
        ],
      ),
    );
  }
}
