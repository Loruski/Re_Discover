import 'package:flutter/material.dart';

enum LeaderboardType { global, local, friends }

class LeaderboardScrollView extends StatefulWidget {
  
  const LeaderboardScrollView({super.key, required this.tabController});

  final TabController tabController;

  @override
  State<LeaderboardScrollView> createState() => _LeaderboardScrollViewState();
}

class _LeaderboardScrollViewState extends State<LeaderboardScrollView> {
  LeaderboardType? type;

  @override
  void initState() {
    super.initState();
    widget.tabController.addListener(() =>
      setState(() {
        type = LeaderboardType.values[widget.tabController.index];
      }
    ));
  }


  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList.builder(
          itemBuilder:
              (context, index) => // Global
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text("Leaderboard Tile $type"),
                  subtitle: TextButton(
                    onPressed: () {},
                    child: const Text("View Profile"),
                  ),
                  leading: const CircleAvatar(child: Icon(Icons.emoji_events)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                      width: 1,
                    ),
                  ),
                ),
              ),
        ),
      ],
    );
  }
}


