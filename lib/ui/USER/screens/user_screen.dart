import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:re_discover/ui/USER/view_model/user_view_model.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserViewModel(),
      child: UserScreenContent(),
    );
  }
}

class UserScreenContent extends StatelessWidget {
  const UserScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text("user screen"),
          )
      ),
    );
  }

}