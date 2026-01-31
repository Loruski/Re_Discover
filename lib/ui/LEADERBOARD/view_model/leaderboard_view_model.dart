import 'package:flutter/foundation.dart';
import 'package:re_discover/data/repositories/data_repository_impl/user_repository.dart';
import 'package:re_discover/data/repositories/repository_hub.dart';
import 'package:re_discover/data/states/state_hub.dart';
import 'package:re_discover/domain/models/user.dart';

class LeaderboardViewModel extends ChangeNotifier {

  User user = StateHub().userState.user;

  ValueNotifier<int> get poisCount => StateHub().visitState.poisCount;

  UserRepository userRepository = RepositoryHub().userRepository;

  LeaderboardViewModel() {
    _initializePOIsCount();
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
    return await userRepository.data;
  }

  @override
  void dispose() {
    StateHub().userState.removeListener(_onUserStateChanged);
    super.dispose();
  }
}
