import 'package:flutter/material.dart';
import 'package:re_discover/ui/CITIES/view_model/cities_view_model.dart';
import 'package:re_discover/ui/LEADERBOARD/view_model/leaderboard_view_model.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key, required this.leaderboardViewModel});

  final LeaderboardViewModel leaderboardViewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListenableBuilder(
              listenable: leaderboardViewModel,
              builder: (context, _){
                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Benvenuto nella schermata leaderboard'),
                      FloatingActionButton.extended(
                          label: Text('Counter: ${leaderboardViewModel.counter}'),
                          onPressed: leaderboardViewModel.incrementCounter
                      ),
                      const SizedBox(height: 8),
                      Text('Counter: ${leaderboardViewModel.counter}'),
                    ],
                  ),
                );
              }
          )
      )
    );
  }
}