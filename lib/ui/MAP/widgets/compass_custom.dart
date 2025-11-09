import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:re_discover/ui/MAP/view_model/map_view_model.dart';
import 'package:re_discover/ui/MAP/widgets/map_screen.dart';
import 'package:latlong2/latlong.dart';

class CompassCustom extends StatefulWidget {
  const CompassCustom({super.key, required this.mapViewModel});

  final MapViewModel mapViewModel;

  @override
  State<StatefulWidget> createState() => _CompassCustom();
}

class _CompassCustom extends State<CompassCustom> {
  @override
  Widget build(BuildContext context) {
    return                         Container(
      color: Colors.white,
      child: Text("qui ci va la bussola"),
    );
  }
}