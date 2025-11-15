import 'package:flutter/material.dart';

class CitySelectorScreenHeader extends StatelessWidget {
  const CitySelectorScreenHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(Icons.map, size: 60, color: Color.fromARGB(255, 3, 2, 19)),
        Text(
          "Re:Discover",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.purple,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Select the city to explore!",
              style: TextStyle(fontSize: 15, color: Colors.blueGrey),
            ),
          ],
        ),
      ],
    );
  }
}
