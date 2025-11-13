import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:re_discover/ui/MAP/widgets/POI_modal_bottom_sheet.dart';

void onShowModalMap({
  required BuildContext context,
  required ValueNotifier<double> distanceNotifier,
}) async {
  await showModalBottomSheet(
    context: context,
    backgroundColor: Colors.white,
    isScrollControlled: true,
    builder: (ctx) => PoiModalBottomSheet(
      distanceNotifier: distanceNotifier,
    ),
  );
}
