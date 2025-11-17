import 'package:flutter/foundation.dart';
import 'package:re_discover/data/repositories/repository_hub.dart';
import 'package:re_discover/domain/models/user.dart';

class MainViewModel extends ChangeNotifier {
  late User? _user;
  late List<User> _appUsers;

  MainViewModel(){
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    _appUsers = await RepositoryHub().users;
  }

  User? get user => _user;
}
