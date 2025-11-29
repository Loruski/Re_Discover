import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:re_discover/data/states/user_state.dart';

class HomeScreenHeader extends StatelessWidget {
  const HomeScreenHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(Icons.account_circle, size: 80, color: Colors.purple),
        Text(
          "Re:Discover",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.purple,
          ),
        ),
        Consumer<UserState>(
          builder: (context, userState, child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Ciao, ${userState.user?.username}!",
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ),
                SizedBox(width: 5),
                Icon(Icons.waving_hand, size: 20, color: Colors.orange),
              ],
            );
          },
        ),
      ],
    );
  }
}
