import 'package:flutter/material.dart';

class MapViewModel extends StatefulWidget {
  const MapViewModel({Key? key}) : super(key: key);

  @override
  _MapViewModel createState() => _MapViewModel();
}

class _MapViewModel extends State<MapViewModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map'),
      ),
      body: const Center(
        child: Text('Map View Model'),
      ),
    );
  }
}