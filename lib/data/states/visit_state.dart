import 'package:flutter/foundation.dart';

class VisitState {
  final ValueNotifier<bool> isVisiting = ValueNotifier<bool>(false);

  void startVisit() {
    isVisiting.value = true;
  }

  void endVisit() {
    isVisiting.value = false;
  }

  void setVisit(bool state) {
    isVisiting.value = state;
  }

}
