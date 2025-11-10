import 'package:flutter/material.dart';
import 'package:re_discover/ui/MAP/view_model/map_view_model.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:re_discover/ui/MAP/widgets/compass_banner_custom.dart';
import 'package:re_discover/ui/MAP/widgets/OSM_custom.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key, required this.mapViewModel});

  final MapViewModel mapViewModel;

  @override
  State<StatefulWidget> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  @override
  Widget build(BuildContext context) {
    return  ListenableBuilder(
          listenable: widget.mapViewModel,
          builder: (context, _){
            return Scaffold(
                appBar: AppBar(
                  backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                  bottom: PreferredSize(
                      preferredSize: const Size.fromHeight(4.0),
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(10, 0, 0, 5),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: const Column(
                              children: [
                                Text('Roma, Italia',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    )
                                ),
                                Text("0/5 luoghi visitati")
                              ],
                            ),
                          )
                      )
                  ),
                ),
                body: SafeArea(
                    child: Column(
                      children: [
                        CompassBannerCustom(mapViewModel: widget.mapViewModel),
                        OsmCustom(mapViewModel: widget.mapViewModel),
                      ],
                    )
                )
            );
          }
      );


  }
}