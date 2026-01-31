import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:re_discover/data/states/state_hub.dart';
import 'package:re_discover/ui/USER/screens/badges_screen.dart';
import 'package:re_discover/ui/USER/screens/profile_personalization.dart';
import 'package:re_discover/ui/USER/widgets/user_screen_header.dart';
import 'package:re_discover/ui/USER/view_model/user_view_model.dart';
import 'package:re_discover/ui/USER/widgets/users_infos_cards.dart';
import 'package:re_discover/ui/core/widgets/level_card.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserViewModel()..initState()),
        ChangeNotifierProvider.value(value: StateHub().userState)
      ],
      child: UserScreenContent(),
    );
  }
}

class UserScreenContent extends StatelessWidget {
  const UserScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    final userViewModel = context.watch<UserViewModel>();
    return Scaffold(
      body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                expandedHeight: 160.0, // aumenta per fare spazio all'header
                flexibleSpace: FlexibleSpaceBar(
                  background: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 20, 16, 5),
                    child: Align(
                      alignment: Alignment.center,
                      child: UserScreenHeader(),
                    ),
                  ),
                ),
              ),
              SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Padding(
                          padding: const EdgeInsets.fromLTRB(16, 5, 16, 5),
                          child:  Column(
                            spacing: 3,
                            children: [
                              // Dart
                              LevelCard(),
                              UsersInfosCards(
                                iconCard1: Icons.check,
                                iconCard2: Icons.trending_up_outlined,
                                titleCard1: 'Correct Answers',
                                titleCard2: 'Accuracy',
                                infoCard1: '60',
                                infoCard2: '90%',
                                cardColor1: Colors.green,
                                cardColor2: Colors.blue,
                              ),
                              UsersInfosCards(
                                iconCard1: Icons.place_outlined,
                                iconCard2: Icons.workspace_premium,
                                titleCard1: 'Visited Places',
                                titleCard2: 'Unlocked Badges',
                                infoCard1: '3',
                                infoCard2: '6',
                                cardColor1: Colors.purple,
                                cardColor2: Colors.orange,
                              ),
                              SizedBox(height: 10),
                              SizedBox(
                                width: double.infinity,
                                height: 40,
                                child: FloatingActionButton.extended(
                                  elevation: 1,
                                  heroTag: null,
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    side: const BorderSide(color: Colors.purple, width: 1),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) =>  BadgesScreen(badges: userViewModel.badges)),
                                    );
                                  },
                                  icon: const Icon(Icons.workspace_premium, color: Colors.black),
                                  label: const Text(
                                    'See your Badges',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                      ),
                    ]
                  )
              )
            ]
          )
      ),
    );
  }

}