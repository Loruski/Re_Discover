import 'package:flutter/material.dart';

class HomeScreenAnswersAccuracyCards extends StatelessWidget {
  const HomeScreenAnswersAccuracyCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: SizedBox(
              height: 120,
              child: Card(
                color: Colors.white,
                elevation: 1,
                shadowColor: Colors.black,
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.check_circle_outline,
                      size: 40,
                      color: Colors.green,
                    ),
                    Text(
                      "Risposte corrette",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),

                    /// Here we should also update this stat dynamically
                    Text("11"),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 120,
              child: Card(
                color: Colors.white,
                elevation: 1,
                shadowColor: Colors.black,
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.gps_fixed, size: 40, color: Colors.blue),
                    Text(
                      "Precisione",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),

                    /// Here we should also update this stat dynamically
                    Text("43%"),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
