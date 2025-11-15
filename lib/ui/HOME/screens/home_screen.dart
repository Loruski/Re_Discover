import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:re_discover/ui/HOME/view_model/home_view_model.dart';
import 'package:re_discover/ui/HOME/widgets/home_screen_subwidgets/home_screen_answers_accuracy_cards.dart';
import 'package:re_discover/ui/HOME/widgets/home_screen_subwidgets/home_screen_exploration_button.dart';
import 'package:re_discover/ui/HOME/widgets/home_screen_subwidgets/home_screen_header.dart';
import 'package:re_discover/ui/HOME/widgets/home_screen_subwidgets/home_screen_level_card.dart';
import 'package:re_discover/ui/MAP/screens/quiz_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeViewModel(),
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
                spacing: 20,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  HomeScreenHeader(),
                  HomeScreenLevelCard(),
                  HomeScreenAnswersAccuracyCards(),
                  HomeScreenExplorationButton(),
                ]
              )
            ),
          )
      ),
        floatingActionButton: FloatingActionButton(heroTag: null, onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => QuizScreen()))),
    );
  }

}