import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:re_discover/ui/MAP/view_model/map_view_model.dart';
import 'package:re_discover/ui/MAP/widgets/compass_widget.dart';
import 'package:re_discover/ui/MAP/widgets/map_screen.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_compass/flutter_compass.dart';

class CompassBannerCustom extends StatefulWidget {
  const CompassBannerCustom({super.key, required this.mapViewModel});

  final MapViewModel mapViewModel;

  @override
  State<StatefulWidget> createState() => _CompassBannerCustom();
}

class _CompassBannerCustom extends State<CompassBannerCustom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          Align(
              alignment: AlignmentGeometry.centerLeft,
              child:CompassWidget(mapViewModel: widget.mapViewModel)
          ),
          Expanded(
              flex:1,
              child: Container(
                margin: EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Li Paparuni',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )
                    ),
                    Text("500m to destination")
                  ],
                ),
              )
          )
        ],
      )

    );
  }
}