import 'package:flutter/foundation.dart';

class HomeViewModel extends ChangeNotifier {
  // insert repository here

  int counter = 0;



  void incrementCounter() {
    counter++;
    notifyListeners();
  }


}
