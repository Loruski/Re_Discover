import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:re_discover/ui/MAP/view_model/map_view_model.dart';
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
    return Expanded(
      child: FlutterMap(
        mapController: widget.mapViewModel.mapController,
        options: MapOptions(
          initialCenter:
              widget.mapViewModel.currentCenter ??
              const LatLng(42.405916, 12.856193),
          initialZoom: widget.mapViewModel.currentZoom ?? 13.0,
          onPositionChanged: (position, hasGesture) {
            widget.mapViewModel.updateMapPosition(
              position.center!,
              position.zoom!,
            );
          },
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'it.univaq.egs.re_discover',
          ),
          CurrentLocationLayer(
            alignPositionOnUpdate: AlignOnUpdate.always,
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
              child: FloatingActionButton(
                onPressed: widget.mapViewModel.getUserPosition,
                child: const Icon(Icons.my_location),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
