import 'package:flutter/foundation.dart';
import 'package:re_discover/data/repositories/data_repository_impl/user_repository.dart';
import 'package:re_discover/data/repositories/repository_hub.dart';
import 'package:re_discover/domain/models/user.dart';

class LeaderboardViewModel extends ChangeNotifier {
  // insert repository here

  UserRepository userRepository = RepositoryHub().userRepository;


  Future<void> updateLeaderboard() async {
    userRepository.update();
    notifyListeners();
  }

  Future<List<User>> getLeaderboard() async {
    return await userRepository.data;
  }


}
