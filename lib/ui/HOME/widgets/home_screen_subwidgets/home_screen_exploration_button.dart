import 'package:flutter/material.dart';
import 'package:re_discover/ui/HOME/screens/city_selector_screen.dart';

class HomeScreenExplorationButton extends StatelessWidget {
  const HomeScreenExplorationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton.icon(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CitySelectorScreen()
                )
            );
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
            backgroundColor: Colors.purple,
          ),
          icon: const Icon(Icons.explore_outlined, color: Colors.white),
          label: const Text(
            "Inizia esplorazione",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
