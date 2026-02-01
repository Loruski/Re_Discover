import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:re_discover/data/repositories/data_repository_impl/user_repository.dart';
import 'package:re_discover/data/repositories/repository_hub.dart';
import 'package:re_discover/data/states/state_hub.dart';
import 'package:re_discover/domain/models/user.dart';
import 'package:re_discover/ui/LEADERBOARD/screen/leaderboard_screen.dart';

class LeaderboardViewModel extends ChangeNotifier {

  User user = StateHub().userState.user;

  ValueNotifier<int> get poisCount => StateHub().visitState.poisCount;

  Future<Map<User, int>> poiCountMap = Future(() => {});

  UserRepository userRepository = RepositoryHub().userRepository;

  Future<List<User>> orderedList = Future(() => []);

  int userRank = 0;
  
  Categories selectedCategory = Categories.xp;
  Categories? orderedByCategory;


  LeaderboardViewModel() {
    _initializePOIsCount();
    selectedCategory = Categories.xp;
    orderedList = getLeaderboard();
    poiCountMap = userRepository.getPOIsCountAllUsers();

    // Ascolta i cambiamenti di UserState
    StateHub().userState.addListener(_onUserStateChanged);
  }

  void _onUserStateChanged() {
    refreshUser();
  }

  void refreshUser() {
    user = StateHub().userState.user;
    notifyListeners();
  }

  Future<void> _initializePOIsCount() async {
    await StateHub().visitState.getPOIsCount();
  }

  Future<void> updateLeaderboard() async {
    userRepository.update();
    notifyListeners();
  }

  Future<List<User>> getLeaderboard() async {

      if(selectedCategory == orderedByCategory) {
        return orderedList;
      }

      orderedList = userRepository.data;
      orderList(await orderedList);

    return orderedList;
  }

  void orderList(List<User> toSort) async {

    switch (selectedCategory) {
        case Categories.xp:
          toSort.sort((a, b) => b.xp.compareTo(a.xp));
          orderedByCategory = Categories.xp;
          break;
        case Categories.poi:
          Map pois = await poiCountMap;
          toSort.sort((a, b) => pois[b].compareTo(pois[a]));
          orderedByCategory = Categories.poi;
          break;
    }
    userRank = toSort.indexOf(user) + 1;
    orderedList = Future.value(toSort);
    notifyListeners();
  }

  void changeCategory(Categories newCategory) {
    selectedCategory = newCategory;
    notifyListeners();
  }
  @override
  void dispose() {
    StateHub().userState.removeListener(_onUserStateChanged);
    super.dispose();
  }
  
  
}
