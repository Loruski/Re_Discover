import 'package:flutter/material.dart';

enum LeaderboardType { global, local, friends }

class LeaderboardScrollView extends StatelessWidget {
  const LeaderboardScrollView({super.key, required this.leaderboardType});

  final LeaderboardType leaderboardType;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList.builder(
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
              child: getListTile(index),
            ),
          ),
        ),
      ],
    );
  }
}

LeaderboardTile getListTile(int index) {
  if (index == 0) {
    return LeaderboardTile(
      color: Colors.yellow, 
      data: "1232212", 
      position: 1
      );
  }
  if (index == 1) {
    return LeaderboardTile(
      color: Colors.cyan.shade50,
      data: "12323",
      position: 2,
    );
  }
  if (index == 2) {
    return LeaderboardTile(
      color: Colors.brown.shade400,
      data: "123",
      position: 3,
    );
  }
  return LeaderboardTile(data: "12", position: index + 1);
}

class LeaderboardTile extends StatelessWidget {
  final Color color;
  final String data; //TODO insert user data
  final int position;

  const LeaderboardTile({
    super.key,
    this.color = Colors.white,
    required this.data,
    required this.position,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 8.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: color,
            child: Text(position.toString(), style: TextStyle(fontSize: 20, 
            fontWeight: FontWeight.bold,
            fontFeatures: [FontFeature.ordinalForms()]),),
          ),
          const SizedBox(width: 16),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Leaderboard Tile", style: TextStyle(fontSize: 20)),
              Text("Subtitle", style: TextStyle(fontSize: 16),)
            ],
          ),
          const Spacer(),
          SizedBox(
            width: 100,
            child: FittedBox(
              alignment: Alignment.centerRight,
              fit: BoxFit.scaleDown,
              child: Card(
                color: color,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.all(
                    Radius.circular(10),
                  ),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 2,
                      horizontal: 8,
                    ),
                    child: Text(
                      data,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                    ), // TODO if the value exceeds 1000 divide it by 1000, and so on
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
