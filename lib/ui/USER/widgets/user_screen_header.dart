import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:re_discover/data/states/user_state.dart';
import 'package:re_discover/ui/USER/screens/profile_personalization.dart';
import 'package:re_discover/ui/USER/view_model/user_view_model.dart';


class UserScreenHeader extends StatelessWidget {
  const UserScreenHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UserState>(
      builder: (context, userState, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                Icon(Icons.account_circle, size: 80, color: Colors.purple),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () {
                      final userViewModel = context.read<UserViewModel>();
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ProfilePersonalization(
                            cosmetics: userViewModel.cosmetics,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.edit_rounded,
                        size: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Text(
              "${userState.user?.username}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Level ${userState.user?.level}",
                  style: TextStyle(fontSize: 15, color: Colors.blueGrey),
                ),
                const SizedBox(width: 5),
                const Icon(Icons.diamond, size: 16, color: Colors.pink),
                const Text(
                  "5",
                  style: TextStyle(fontSize: 15, color: Colors.blueGrey),
                ),
              ],
            )

          ],
        );
      });
  }
}
