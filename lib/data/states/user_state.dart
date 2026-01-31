import 'package:flutter/foundation.dart';
import 'package:re_discover/data/repositories/data_repository_impl/user_repository.dart';
import 'package:re_discover/domain/models/user.dart';

class UserState extends ChangeNotifier {
  final UserRepository _userRepository;

  User? _user;
  User? get user => _user;

  UserState(this._userRepository);

  Future<bool> loadUser() async {
    _user = await _userRepository.getLoggedInUser();
    notifyListeners();

    return _user != null;
  }
}
