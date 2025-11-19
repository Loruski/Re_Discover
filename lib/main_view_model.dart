import 'package:flutter/foundation.dart';
import 'package:re_discover/data/repositories/data_repository_impl/user_repository.dart';
import 'package:re_discover/data/repositories/repository_hub.dart';
import 'package:re_discover/domain/models/user.dart';

class MainViewModel extends ChangeNotifier {
  late User? _user;
  late List<User> _appUsers;
  final UserRepository _userRepository = RepositoryHub().userRepository;

  MainViewModel();

  Future<bool> shouldOobeBeRunned() async {
    _user = await _userRepository.getLoggedInUser();

    if (_user == null) return true;
    return false;
  }

}
