import 'package:flutter/material.dart';
import 'package:re_discover/ui/MAP/view_model/map_view_model.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:re_discover/ui/MAP/widgets/compass_banner_custom.dart';
import 'package:re_discover/ui/MAP/widgets/OSM_custom.dart';

class LevelWidget extends StatefulWidget {
  const LevelWidget({super.key, required this.mapViewModel});

  final MapViewModel mapViewModel;

  @override
  State<StatefulWidget> createState() => _LevelWidget();
}

class _LevelWidget extends State<LevelWidget> {
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.mapViewModel,
      builder: (context, _) {
        child: return Container(
          height: 90,
          margin: EdgeInsets.only(top: 10, left: 10, right: 10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  "1",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ) ,
              ),
              Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Level 1',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              )
                          ),
                          Text("XP in this session: +1500 XP")
                        ],
                      ),
                    ),
                  )

              )
            ],
          ),
        );
      },
    );
  }
}
