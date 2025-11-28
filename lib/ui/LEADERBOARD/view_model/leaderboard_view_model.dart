import 'package:flutter/foundation.dart';

class LeaderboardViewModel extends ChangeNotifier {
  // insert repository here

  int counter = 0;



  void incrementCounter() {
    counter++;
    notifyListeners();
  }


}
