import 'package:flutter/material.dart';
import 'package:re_discover/domain/models/city.dart';
import 'package:re_discover/ui/MAP/widgets/POI_modal_bottom_sheet.dart';
import 'package:re_discover/ui/MAP/widgets/city_modal_bottom_sheet.dart';

void onShowModalMap({
  required BuildContext context,
  required ValueNotifier<double> distanceNotifier,
}) async {
  await showModalBottomSheet(
    context: context,
    backgroundColor: Colors.white,
    isScrollControlled: true,
    builder: (ctx) => PoiModalBottomSheet(distanceNotifier: distanceNotifier),
  );
}

void onShowModalCity({
  required BuildContext context,
  required City city,
}) async {
  await showModalBottomSheet(
    context: context,
    backgroundColor: Colors.white,
    isScrollControlled: true,
    builder: (ctx) => CityModalBottomSheet(city: city),
  );
}
