import 'package:flutter/material.dart';
import 'package:re_discover/data/repositories/data_repository_impl/user_repository.dart';
import 'package:re_discover/data/repositories/repository_hub.dart';

class OobeViewModel extends ChangeNotifier {
  final _formKey = GlobalKey<FormState>();
  late String _username;
  final TextEditingController _usernameController = TextEditingController();
  final UserRepository userRepository = RepositoryHub().userRepository;

  OobeViewModel();

  GlobalKey<FormState> get formKey => _formKey;
  TextEditingController get usernameController => _usernameController;

  String get username => _username;

  set username(String value) {
    _username = value;
    notifyListeners();
  }

  String? validateUsername(String? typedUsername) {
    if (typedUsername == null || typedUsername.isEmpty) {
      return "Per favore, inserisci un nome valido";
    }

    // Username regex pattern (alphanumeric and underscores, 3-30 characters)
    final RegExp usernameRegex = RegExp(r'^[a-zA-Z0-9_]{3,30}$');
    if (!usernameRegex.hasMatch(typedUsername)) {
      return 'Il tuo nome può essere lungo da 3 a 30 caratteri e contenere solo lettere, numeri e trattini bassi';
    }

    return null;
  }
  
  void saveTemporaryUser() {
    userRepository.storeTemporaryUser(_username);
    notifyListeners();
  }

}
