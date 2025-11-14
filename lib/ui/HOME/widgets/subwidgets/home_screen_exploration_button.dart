import 'package:flutter/material.dart';

class HomeScreenExplorationButton extends StatelessWidget {
  const HomeScreenExplorationButton({super.key});


  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        // TODO: Implement navigation
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 15,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        backgroundColor: Colors.purple,
      ),
      icon: const Icon(
        Icons.explore_outlined,
        color: Colors.white,
      ),
      label: const Text(
        "Inizia esplorazione",
        style: TextStyle(color: Colors.white),
      ),
    );
  }


}