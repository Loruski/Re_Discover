import 'package:flutter/material.dart';

enum LeaderboardType { global, local, friends }

class LeaderboardScrollView extends StatelessWidget {
  const LeaderboardScrollView({super.key, required this.leaderboardType});

  final LeaderboardType leaderboardType;

  @override
  Widget build(BuildContext context) {
    return 
        CustomScrollView(
          slivers: [SliverList.builder(
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(1.2),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                    width: 1,
                  ),
                ),
                child: ListTile(
                  title: Text("Leaderboard Tile $leaderboardType"),
                  subtitle: TextButton(
                    onPressed: () {},
                    child: const Text("View Profile"),
                  ),
                  leading: const CircleAvatar(child: Icon(Icons.emoji_events)),
                ),
              ),
            ),
          ),]
        );
  }
}
