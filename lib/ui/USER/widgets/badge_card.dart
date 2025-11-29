import 'package:flutter/material.dart';

class BadgeCard extends StatelessWidget {
  const BadgeCard({
    super.key,
    required this.iconCard1,
    required this.titleCard1,
    required this.infoCard1,
    required this.unlocked,
  });

  final IconData iconCard1;
  final String titleCard1;
  final String infoCard1;
  final bool unlocked;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            spacing: 3,
            children: [
              Icon(iconCard1, size: 40, color: Colors.black),
              Text(infoCard1, style: TextStyle(fontSize: 16)),
              Text(titleCard1),
            ],
          ),
        ),
      ),
    );
  }
}
