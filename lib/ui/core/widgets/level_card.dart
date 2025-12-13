import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:re_discover/data/states/user_state.dart';

class LevelCard extends StatelessWidget {
  const LevelCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          spacing: 10,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      "Level",
                      style: TextStyle(fontSize: 13, color: Colors.black),
                    ),
                    Consumer<UserState>(
                      builder: (context, userState, child) {
                        return Text(
                          "${userState.user?.level}",
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      },
                    ),
                  ],
                ),
                Icon(Icons.track_changes, size: 50, color: Colors.orange),
              ],
            ),
            LinearProgressIndicator(
              value: 0.4,
              minHeight: 6,
              borderRadius: BorderRadius.circular(10),
              backgroundColor: Colors.grey[300],
              color: Colors.orange,
            ),
            Text("80 / 120 XP"),
          ],
        ),
      ),
    );
  }
}
