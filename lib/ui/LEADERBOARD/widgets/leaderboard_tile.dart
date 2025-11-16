import 'package:flutter/material.dart';

class LeaderboardTile extends StatelessWidget {
  const LeaderboardTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text("Leaderboard Tile"),
      subtitle: TextButton(onPressed: () {}, child: const Text("View Profile")),
      leading: const CircleAvatar(child: Icon(Icons.emoji_events)),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: Theme.of(context).colorScheme.primary, width: 1),
      ),
    );
  }
}
