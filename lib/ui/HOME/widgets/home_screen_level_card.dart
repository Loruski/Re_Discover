import 'package:flutter/material.dart';

class HomeScreenLevelCard extends StatelessWidget {
  const HomeScreenLevelCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      color: Colors.white,
      elevation: 1,
      shadowColor: Colors.black,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Livello",
                      style: TextStyle(fontSize: 13, color: Colors.black),
                    ),

                    /// Here we should retrieve user's level
                    Text(
                      "1",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Icon(Icons.radar, size: 50, color: Colors.orange),
              ],
            ),
            SizedBox(height: 10),
            LinearProgressIndicator(
              /// Here we should calculate the value from the amount of required XP to level up and the amount of XP the user has
              value: 0.4,
              minHeight: 6,
              borderRadius: BorderRadius.circular(10),
              backgroundColor: Colors.grey[300],
              color: Colors.orange,
            ),
            SizedBox(height: 15),

            /// Here we should retrieve the amount of XP that the user has, and the amount of XP required to level up
            Text("80 / 120 XP"),
          ],
        ),
      ),
    );
  }
}
