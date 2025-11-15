import 'package:flutter/material.dart';
import 'package:re_discover/ui/MAP/screens/quiz_completed_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  //TODO: implementare parametri necessari per il quiz (probabilmente si passa solo l'id)

  @override
  State<StatefulWidget> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Quiz Time!", style: TextStyle(fontSize: 20)),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                "Unlock Colosseo",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ), // titolo quiz
              SizedBox(height: 20),
              Text(
                "<stessa descrizione della card del quiz>",
                style: TextStyle(fontSize: 16),
              ), // titolo e descrizione quiz
              SizedBox(height: 50),
              Flex(direction: Axis.horizontal, children: []),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Domanda di sblocco", style: TextStyle(fontSize: 16)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Tentativi: ", style: TextStyle(fontSize: 16)),
                      Icon(Icons.circle, color: Colors.green, size: 16),
                      Icon(Icons.circle, color: Colors.green, size: 16),
                      Icon(Icons.circle, color: Colors.green, size: 16),
                    ],
                  ),
                ],
              ), // titolo sezione domanda e tentativi
              SizedBox(height: 20),
              Flex(
                direction: Axis.horizontal,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Questa è una possibile domanda?"),
                          SizedBox(height: 20),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 2,
                            children: [
                              Flex(
                                direction: Axis.vertical,
                                children: [
                                  SizedBox(
                                    width: double.infinity,
                                    child: OutlinedButton(
                                      onPressed: () => {},
                                      child: Text("Possibile risposta 1"),
                                    ),
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: OutlinedButton(
                                      onPressed: () => {},
                                      child: Text("Possibile risposta 1"),
                                    ),
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: OutlinedButton(
                                      onPressed: () => {},
                                      child: Text("Possibile risposta 1"),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ), // box domanda e risposte
              SizedBox(height: 20),
              Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: FloatingActionButton(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute<void>(
                            builder: (context) => const QuizCompletedScreen(),
                          ),
                        );
                      },
                      child: Text("Conferma Risposta"),
                    ),
                  ),
                ],
              ), // bottone conferma risposta
            ],
          ),
        ),
      ),
    );
  }
}
