import 'package:flutter/material.dart';
import 'package:re_discover/ui/USER/view_model/user_view_model.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key, required this.userViewModel});

  final UserViewModel userViewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListenableBuilder(
              listenable: userViewModel,
              builder: (context, _){
                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Benvenuto nella schermata user'),
                      FloatingActionButton.extended(
                          label: Text('Counter: ${userViewModel.counter}'),
                          onPressed: userViewModel.incrementCounter
                      ),
                      const SizedBox(height: 8),
                      Text('Counter: ${userViewModel.counter}'),
                    ],
                  ),
                );
              }
          )
      )
    );
  }
}