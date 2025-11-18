import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:re_discover/data/repositories/data_repository_impl/user_repository.dart';
import 'package:re_discover/data/repositories/repository_hub.dart';
import 'package:re_discover/domain/models/cosmetic.dart';
import 'package:re_discover/domain/models/badge.dart' as ReDiscover;
import 'package:re_discover/domain/models/user.dart';

class MainViewModel extends ChangeNotifier {
  late User? _user;
  late List<User> _appUsers;
  final UserRepository _userRepository = RepositoryHub().userRepository;

  MainViewModel();

  Future<bool> shouldOobeBeRunned() async {
    var temporaryUser = await _userRepository.getTemporaryUser();
    var isTemporaryUserNull = temporaryUser == null;

    if (isTemporaryUserNull) return true;

    // I'll move this one into the UserRepository and refactor the rest of the code here
    _user = User(
        id: int.parse(temporaryUser[0]),
        username: temporaryUser[1],
        xp: double.parse(temporaryUser[2]),
        level: int.parse(temporaryUser[3]),
        badges: <ReDiscover.Badge>{},
        customizables: <Cosmetic>{});

    log(_user!.username.toString());
    return false;
  }
}
