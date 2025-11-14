import 'package:flutter/material.dart';

class QuizCompletedScreen extends StatefulWidget {
  const QuizCompletedScreen({super.key});

  //TODO: implementare la presa dell'utente, gli xp guadagnati, e altre info necessarie per aumentare di livello/xp

  @override
  State<StatefulWidget> createState() => _QuizCompletedScreenState();
}

class _QuizCompletedScreenState extends State<QuizCompletedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Quiz Completed!", style: TextStyle(fontSize: 20)),
      ),
      body: SafeArea(child: Center(
        child: Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flex(
              direction: Axis.vertical,
              children: [
                Icon(Icons.trending_up_outlined, size: 100, color: Colors.amber),
                Text(
                  "Quiz Completed!",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      )),

    );
  }
}
