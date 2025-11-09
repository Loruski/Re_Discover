import 'package:flutter/material.dart';
import 'package:re_discover/ui/HOME/view_model/home_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.citiesViewModel});

  final HomeViewModel citiesViewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListenableBuilder(
              listenable: citiesViewModel,
              builder: (context, _){
                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Benvenuto nella schermata città'),
                      FloatingActionButton.extended(
                          label: Text('Counter: ${citiesViewModel.counter}'),
                          onPressed: citiesViewModel.incrementCounter
                      ),
                      const SizedBox(height: 8),
                      Text('Counter: ${citiesViewModel.counter}'),
                    ],
                  ),
                );
              }
          )
      )
    );
  }
}