import 'package:flutter/material.dart';
import 'package:re_discover/ui/MAP/view_model/map_view_model.dart';
import 'package:re_discover/ui/MAP/widgets/compass_widget.dart';

class CompassBannerCustom extends StatelessWidget {
  const CompassBannerCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          Align(
              alignment: Alignment.centerLeft,
              child:CompassWidget()
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