import 'dart:ui';

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
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Quiz Time!", style: TextStyle(fontSize: 20)),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            spacing: 2,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                "Unlock Colosseo",
                style: TextStyle(
                  fontSize: 24, 
                  fontWeight: FontWeight.bold
                  ),
              ),  // titolo quiz
              SizedBox(height: 20),
              Text(
                "<stessa descrizione della card del quiz>\n<stessa descrizione della card del quiz>",
                style: TextStyle(fontSize: 16),
              ), // titolo e descrizione quiz
              Container(
                padding: const EdgeInsets.all(15.0),
                // clip the borders to be rounded
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  
                  // boxShadow: [BoxShadow(
                  //   color: Colors.grey.withValues(alpha: 0.5),
                  //   spreadRadius: 3,
                  //   blurRadius: 18,
                  //   offset: Offset(0, 0),
                  //    // changes position of shadow
                  // )],
                  
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network("https://images.unsplash.com/photo-1552832230-c0197dd311b5?w=800",),
                  
                  ),
              ), // immagine quiz
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
                      Icon(Icons.circle, color: Colors.red, size: 16),
                    ],
                  ),
                ],
              ), // titolo sezione domanda e tentativi
              SizedBox(height: 20),
              Flex(
                direction: Axis.horizontal,
                children: [
                  Expanded(
                    child: Card(
                      elevation: 4,
              
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(100, 10, 100, 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Questa è una possibile domanda?"),
                            SizedBox(height: 20),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              spacing: 18,
                              children: [
                                SizedBox( 
                                  width: double.infinity,
                                  child: OutlinedButton(
                                    onPressed: () => {}, // TODO Padding on text too probably
                                    child: Text("Possibile risposta 1 dedwediuwhedkuywegdygeyguweudyhewid2egdu2wydwuwjhdejhdwkjeydwedhywd"),
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
                      ),
                    ),
                  ),
                ],
              ),    // box domanda e risposte
              Spacer(),
              
              Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child:  FloatingActionButton(
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
              ),  // bottone conferma risposta
             
            ],
          ),
        ),
      ),
    );
  }
}
