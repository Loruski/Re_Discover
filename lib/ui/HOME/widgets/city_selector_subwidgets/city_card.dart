import 'package:flutter/material.dart';

class CityCard extends StatelessWidget {
  const CityCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          spacing: 20,
          children: [
            SizedBox(
              width: 120,
              height: 120,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  "https://www.archeoroma.it/wp-content/uploads/colosseo-roma-anfiteatro-flavio-558x400.jpg",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Column(
              spacing: 15,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Roma",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Italia",
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "La città eterna ricca di storia e monumenti",
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.place_outlined,
                          size: 20,
                          color: Colors.blue[700],
                        ),
                        Text(
                          "12 luoghi da scoprire",
                          style: TextStyle(color: Colors.blue[700]),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

}