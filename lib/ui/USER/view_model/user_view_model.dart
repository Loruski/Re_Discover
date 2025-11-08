import 'package:flutter/material.dart';

class UserViewModel extends StatefulWidget {
  const UserViewModel({Key? key}) : super(key: key);

  @override
  _UserViewModel createState() => _UserViewModel();
}

class _UserViewModel extends State<UserViewModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User'),
      ),
      body: const Center(
        child: Text('User View Model'),
      ),
    );
  }
}