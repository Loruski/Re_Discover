import 'package:flutter/material.dart';

class OobeViewModel extends ChangeNotifier {
  final _formKey = GlobalKey<FormState>();
  late String _username;
  final TextEditingController _usernameController = TextEditingController();

  OobeViewModel();

  GlobalKey<FormState> get formKey => _formKey;
  TextEditingController get usernameController => _usernameController;

  String get username => _username;
  
  set username(String value) {
    _username = value;
    notifyListeners();
  }

  String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return "Per favore, inserisci un nome valido";
    }

    // Username regex pattern (alphanumeric and underscores, 3-30 characters)
    final RegExp usernameRegex = RegExp(r'^[a-zA-Z0-9_]{3,30}$');
    if (!usernameRegex.hasMatch(value)) {
      return 'Il tuo nome può essere lungo da 3 a 30 caratteri e contenere solo lettere, numeri e trattini bassi';
    }

    return null;
  }

}