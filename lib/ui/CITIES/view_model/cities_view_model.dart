import 'package:flutter/foundation.dart';
import 'package:re_discover/domain/models/City.dart';

class CitiesViewModel extends ChangeNotifier {
  // insert repository here

  int counter = 0;


  Future<void> _load() async {
    // load at the first time
    notifyListeners();
  }

  void incrementCounter() {
    counter++;
    notifyListeners();
  }


}
