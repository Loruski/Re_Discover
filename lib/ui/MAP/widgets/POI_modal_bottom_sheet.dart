import 'package:flutter/material.dart';

class PoiModalBottomSheet extends StatelessWidget {

  const PoiModalBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Flex(
          direction: Axis.horizontal,
          children:[
            Text("POI Modal Bottom Sheet"),
          ]
      )
    );
  }
}


