import 'package:flutter/foundation.dart';

class HomeViewModel extends ChangeNotifier {
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
