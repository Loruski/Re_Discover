import 'package:flutter/material.dart';

class LeaderboardViewModel extends StatefulWidget {
  const LeaderboardViewModel({Key? key}) : super(key: key);

  @override
  _LeaderboardViewModelState createState() => _LeaderboardViewModelState();
}

class _LeaderboardViewModelState extends State<LeaderboardViewModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leaderboard'),
      ),
      body: const Center(
        child: Text('Leaderboard View Model'),
      ),
    );
  }
}