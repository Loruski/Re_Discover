import 'package:flutter/material.dart';

class OobeCard extends StatelessWidget {
  const OobeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Column(
              children: [
                Icon(Icons.waving_hand, size: 80, color: Colors.yellow[800]),
                Text(
                  "Benvenuto!",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text("Dicci qualcosa su di te", style: TextStyle(fontSize: 14)),
              ],
            ),
            SizedBox(height: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Come ti chiami?",
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                ),
                TextField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.keyboard),
                    hintText: "Inserisci il tuo nome",
                    hintStyle: TextStyle(fontSize: 13),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => {},
              style: ButtonStyle(backgroundColor: WidgetStatePropertyAll<Color>(Colors.black), foregroundColor: WidgetStatePropertyAll<Color>(Colors.white)),
              child: Text(
                "Avanti",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
