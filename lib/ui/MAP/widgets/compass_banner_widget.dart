import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:re_discover/ui/MAP/view_model/map_view_model.dart';
import 'package:re_discover/ui/MAP/widgets/compass_widget.dart';
import 'package:latlong2/latlong.dart';

class CompassBannerCustom extends StatelessWidget {
  const CompassBannerCustom({super.key, required this.userPosition});

  final LatLng userPosition;



  //TODO: make POI data from parameters

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<MapViewModel>(context);

    LatLng poiPosition = viewModel.poiToFindPosition;



    double distance = Geolocator.distanceBetween(
      userPosition.latitude,
      userPosition.longitude,
      poiPosition.latitude,
      poiPosition.longitude,
    );

    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: CompassWidget(
              userPosition: userPosition,
              poiPosition: poiPosition,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Li Paparuni',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text("${distance.toStringAsFixed(2)}m to destination"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
