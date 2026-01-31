import 'package:flutter/foundation.dart';

import '../../domain/models/user.dart';
import '../repositories/repository_hub.dart';
import '../services/gamification_engine_service.dart';

class VisitState {
  final ValueNotifier<bool> isVisiting = ValueNotifier<bool>(false);
  final ValueNotifier<int> poisCount = ValueNotifier<int>(0);

  void startVisit() {
    isVisiting.value = true;
  }

  void endVisit() {
    isVisiting.value = false;
  }

  void setVisit(bool state) {
    isVisiting.value = state;
  }


  Future<int> getPOIsCount() async {

    late int counter;
    User? user = await RepositoryHub().userRepository.getLoggedInUser();



    if(user!=null){
      print("AGGIORNO POI COUNT CON QUESTO USERNAME ${user.username}");
      counter = await GamificationEngineService().getUserPOICount(user.username);

      if(counter!=poisCount.value){
        poisCount.value = counter;
      }

      return poisCount.value;
    }

    return 0;

  }


}
