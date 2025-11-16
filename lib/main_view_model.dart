import 'package:flutter/foundation.dart';
import 'package:re_discover/domain/models/user.dart';

class MainViewModel extends ChangeNotifier {
  User? _user;

  User? get user => _user;
}
