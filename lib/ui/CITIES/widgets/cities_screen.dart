import 'package:flutter/material.dart';
import 'package:re_discover/ui/CITIES/view_model/cities_view_model.dart';

class CitiesScreen extends StatelessWidget {
  const CitiesScreen({super.key, required this.citiesViewModel});

  final CitiesViewModel citiesViewModel;

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