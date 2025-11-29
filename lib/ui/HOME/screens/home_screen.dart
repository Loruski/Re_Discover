import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:re_discover/data/states/state_hub.dart';
import 'package:re_discover/ui/HOME/view_model/home_view_model.dart';
import 'package:re_discover/ui/HOME/widgets/home_screen_subwidgets/home_screen_answers_accuracy_cards.dart';
import 'package:re_discover/ui/HOME/widgets/home_screen_subwidgets/home_screen_exploration_button.dart';
import 'package:re_discover/ui/HOME/widgets/home_screen_subwidgets/home_screen_header.dart';
import 'package:re_discover/ui/core/widgets/level_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
        ChangeNotifierProvider(create: (_) => StateHub().userState)
      ],
      child: HomeScreenContent(),
    );
  }
}

class HomeScreenContent extends StatelessWidget {
  const HomeScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                HomeScreenHeader(),
                SizedBox(height: 20),
                LevelCard(),
                HomeScreenAnswersAccuracyCards(),
                SizedBox(height: 20),
                HomeScreenExplorationButton(),
              ]
            )
          ),
        ),
      ),
    );
  }
}