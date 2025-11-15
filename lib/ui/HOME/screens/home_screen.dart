import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:re_discover/ui/HOME/view_model/home_view_model.dart';
import 'package:re_discover/ui/HOME/widgets/home_screen_answers_accuracy_cards.dart';
import 'package:re_discover/ui/HOME/widgets/home_screen_exploration_button.dart';
import 'package:re_discover/ui/HOME/widgets/home_screen_header.dart';
import 'package:re_discover/ui/HOME/widgets/home_screen_level_card.dart';

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
    final homeViewModel = context.watch<HomeViewModel>();

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  HomeScreenHeader(),

                  SizedBox(height: 30),

                  Column(
                    children: [
                      HomeScreenLevelCard(),
                      HomeScreenAnswersAccuracyCards(),
                      HomeScreenExplorationButton(),

                      SizedBox(height: 5),

                      TextButton(
                        onPressed: () {
                          // TODO: Implement navigation
                        },
                        child: const Text("Cambia città"),
                      ),

                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
