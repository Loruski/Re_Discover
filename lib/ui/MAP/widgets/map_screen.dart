import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:re_discover/ui/MAP/view_model/map_view_model.dart';
import 'package:re_discover/ui/MAP/widgets/compass_banner_widget.dart';
import 'package:re_discover/ui/MAP/widgets/OSM_widget.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MapViewModel()..initState(),
      child: MapScreenContent(),
    );
  }
}

class MapScreenContent extends StatelessWidget {
  const MapScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    final mapViewModel = context.watch<MapViewModel>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 0, 5),
            child: Align(
              alignment: Alignment.topLeft,
              child: Column(
                children: [
                  Text(
                    'Roma, Italia',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text("0/5 luoghi visitati"),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            CompassBannerCustom(
              userPosition: mapViewModel.currentPosition,
            ),
            OsmCustom(
              mapController: mapViewModel.mapController,
              currentCenter: mapViewModel.currentPosition,
              currentZoom: mapViewModel.currentZoom,
              updateMapPosition: mapViewModel.updateZoomLevel,
              isFollowingUser: mapViewModel.isFollowingUser,
              getUserPosition: mapViewModel.getUserPosition,
              followUserPositionToggle: mapViewModel.followUserPositionToggle,
              isFollowingUserBool: mapViewModel.isFollowingUserBool,
            ),
          ],
        ),
      ),
    );
  }
}
