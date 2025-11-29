import 'package:re_discover/data/repositories/repository_hub.dart';
import 'package:re_discover/data/states/user_state.dart';

class StateHub {
  static final StateHub _instance = StateHub._internal();

  factory StateHub() => _instance;

  StateHub._internal();


  final _userRepository = RepositoryHub().userRepository;

  late final _userState = UserState(_userRepository);

  UserState get userState => _userState;
}
