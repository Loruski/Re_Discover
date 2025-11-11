import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:re_discover/ui/MAP/view_model/map_view_model.dart';

class CompassWidget extends StatefulWidget {
  const CompassWidget({super.key});

  @override
  State<StatefulWidget> createState() => _CompassWidget();
}

class _CompassWidget extends State<CompassWidget> {
  CompassEvent? _lastRead;
  DateTime? _lastReadAt;

  @override
  Widget build(BuildContext context) {
    final mapViewModel = context.watch<MapViewModel>();

    return StreamBuilder<CompassEvent>(
      stream: FlutterCompass.events,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error reading heading: ${snapshot.error}');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        double? direction = snapshot.data!.heading;

        // if direction is null, then device does not support this sensor
        // show error message
        if (direction == null) {
          return Center(child: Text("Device does not have sensors !"));
        }

        return Material(
          shape: CircleBorder(),
          clipBehavior: Clip.antiAlias,
          elevation: 4.0,
          child: Container(
            padding: EdgeInsets.all(6.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(shape: BoxShape.circle),
            child: Transform.rotate(
              angle: (direction * (math.pi / 180) * -1),
              child: Icon(Icons.navigation, size: 50, color: Colors.blue),
            ),
          ),
        );
      },
    );
  }

}
