import 'package:flutter/foundation.dart';
import 'package:re_discover/data/states/state_hub.dart';


class HomeViewModel extends ChangeNotifier {
  bool isVisiting = false;
  final visitState = StateHub().visitState;


  void initState() async {
    visitState.isVisiting.addListener(_onVisitStateChanged);
    await _onVisitStateChanged();
  }

  Future<void> _onVisitStateChanged() async {
    isVisiting = visitState.isVisiting.value;
    notifyListeners();
  }

}
