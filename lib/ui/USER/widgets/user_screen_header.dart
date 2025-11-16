import 'package:flutter/material.dart';

class UserScreenHeader extends StatelessWidget {
  const UserScreenHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(Icons.account_circle, size: 80, color: Colors.purple),
          Text(
            "Esploratore",
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Livello 1",
                style: TextStyle(fontSize: 15, color: Colors.blueGrey),
              ),
              SizedBox(width: 5),
              Icon(Icons.diamond, size: 16, color: Colors.pink),
              Text(
                "5",
                style: TextStyle(fontSize: 15, color: Colors.blueGrey),
              ),
            ],
          )

      ],
    );
  }
}
