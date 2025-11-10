import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:re_discover/ui/MAP/view_model/map_view_model.dart';
import 'package:re_discover/ui/MAP/widgets/level_widgest.dart';
import 'package:re_discover/ui/MAP/widgets/map_screen.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';

class OsmCustom extends StatefulWidget {
  const OsmCustom({super.key, required this.mapViewModel});

  final MapViewModel mapViewModel;

  @override
  State<StatefulWidget> createState() => _OsmCustom();
}

class _OsmCustom extends State<OsmCustom> {
  @override
  Widget build(BuildContext context) {
    // return ListenableBuilder(
    //   listenable: widget.mapViewModel,
    //   builder: (context, _) {
        return FlutterMap(
          mapController: widget.mapViewModel.mapController,
          options: MapOptions(
            initialCenter: const LatLng(42.405916, 12.856193),
            initialZoom:  50.0,
            // onPositionChanged: (_, __) {
            //   widget.mapViewModel.getUserPosition();
            // },
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'it.univaq.egs.re_discover',
            ),
            CurrentLocationLayer(
              //alignPositionOnUpdate: widget.mapViewModel.isFollowingUser,
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
                  children: [
                    FloatingActionButton(
                      onPressed: widget.mapViewModel.getUserPosition,
                      child: const Icon(Icons.my_location),
                    ),
                    const SizedBox(height: 10),
                    // FloatingActionButton(
                    //   onPressed: widget.mapViewModel.followUserPositionToggle,
                    //   child: () {
                    //     if (widget.mapViewModel.isFollowingUserBool == true) {
                    //       const Icon(Icons.location_disabled);
                    //     } else {
                    //       const Icon(Icons.location_searching);
                    //     }
                    //   }(),
                    // ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: LevelWidget(mapViewModel: widget.mapViewModel),
            ),
          ],
        );
    //   },
    // );
  }
}
