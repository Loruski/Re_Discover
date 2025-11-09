import 'package:flutter/cupertino.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:re_discover/ui/MAP/view_model/map_view_model.dart';
import 'package:re_discover/ui/MAP/widgets/map_screen.dart';
import 'package:latlong2/latlong.dart';

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
              initialCenter: widget.mapViewModel.currentCenter ?? const LatLng(42.405916, 12.856193),
              initialZoom: widget.mapViewModel.currentZoom ?? 13.0,
              onPositionChanged: (position, hasGesture) {
                widget.mapViewModel.updateMapPosition(position.center!, position.zoom!);
              },
            ),
          children: [
            TileLayer(
              urlTemplate:
              'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'it.univaq.egs.re_discover',
            ),
          ],
        )
    );
  }
}