import 'package:flutter/material.dart';
import 'package:re_discover/ui/CITIES/view_model/cities_view_model.dart';
import 'package:re_discover/ui/MAP/view_model/map_view_model.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key, required this.mapViewModel});

  final MapViewModel mapViewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListenableBuilder(
              listenable: mapViewModel,
              builder: (context, _){
                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Benvenuto nella schermata mappa'),
                      FloatingActionButton.extended(
                          label: Text('Counter: ${mapViewModel.counter}'),
                          onPressed: mapViewModel.incrementCounter
                      ),
                      const SizedBox(height: 8),
                      Text('Counter: ${mapViewModel.counter}'),
                    ],
                  ),
                );
              }
          )
      )
    );
  }
}