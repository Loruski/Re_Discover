import 'package:flutter/material.dart';

class OobeCompletedCard extends StatelessWidget {
  const OobeCompletedCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                const Icon(Icons.check_circle, color: Colors.green, size: 60),
                const Text(
                  "Configurazione completata!",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () => {},
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll<Color>(
                        Colors.black,
                      ),
                      foregroundColor: WidgetStatePropertyAll<Color>(
                        Colors.white,
                      ),
                    ),
                    label: const Text("Inizia la tua avventura"),
                    icon: Icon(Icons.rocket_launch)
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
